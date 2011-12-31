#include "BOSource2.h"

#include <QNetworkAccessManager>
#include <QRegExp>
#include <QStringList>

#include "EasyXml.h"
#include "ChapterRequest.h"
#include "SimpleTranslation.h"


class BOChapterRequest: public ChapterRequest
{
    public:
        BOChapterRequest(
            SimpleTranslation *translation,
            const QString& bookCode,
            int chapterNo,
            QNetworkReply *nreply
        ) : ChapterRequest(translation, bookCode, chapterNo, nreply)
        {
        }

    protected:
        virtual void onNReplyFinished()
        {
            if (error() != QNetworkReply::NoError)
            {
                finished("");
                return;
            }


            QString content = QString::fromUtf8(_nreply->readAll());

            EasyElement* body = tag("body");

            QRegExp re("<span id=\"v(\\d+)\" class=\"v\"><sup>[^<]*</sup>(.*)<br /></span>");
            re.setMinimal(true);

            int pos = 0;
            while ((pos = re.indexIn(content, pos)) != -1)
            {
                pos += re.matchedLength();

                body->append(
                    tag("div")
                    ->attr("class", "par")
                    ->append(
                        tag("div")
                        ->attr("class", "verse")
                        ->attr("verse", re.cap(1))
                        ->append(
                            tag("div")
                            ->attr("class", "verse-label")
                            ->text(re.cap(1))
                        )
                        ->text(re.cap(2))
                    )
                );
            }


            QDomDocument doc;

            tag("html")
            ->append(
                tag("head")
                ->append(
                    tag("meta")
                    ->attr("http-equiv", "Content-Type")
                    ->attr("content", "text/html; charset=utf-8")
                )
                ->append(
                    tag("style")
                    ->text(
                        ".par { margin-left: .8em; text-indent: -1em; }"
                        ".verse-label { min-width: 2.5ex; }"
                    )
                )
            )
            ->append(body)
            ->appendTo(doc)
            ->del();


            QString html = doc.toString();

            html.replace("&lt;i&gt;", "<i>");
            html.replace("&lt;/i&gt;", "</i>");
            html.replace("&lt;i>", "<i>");
            html.replace("&lt;/i>", "</i>");


            finished(html);
        }
};



BOSource2::BOSource2()
    : SimpleSource("u")
{
}

BOSource2::~BOSource2()
{
}


QString BOSource2::chapterUrl(SimpleTranslation* translation, const QString &bookCode, int chapterNo) const
{
    int no = translation->bookCodes().indexOf(bookCode);
    if (no == -1)
        return "<illegal url>";

    no += 1;

    return QString("http://bibleonline.ru/bible/rus/%1/%2/")
            .arg(no, 2, 10, QChar('0'))
            .arg(chapterNo, 2, 10, QChar('0'));
}

ChapterRequest* BOSource2::requestChapter(SimpleTranslation* translation, QNetworkAccessManager *nam, const QString& bookCode, int chapterNo)
{
    return new BOChapterRequest(
        translation, bookCode, chapterNo,
        nam->get(QNetworkRequest(QUrl(
            chapterUrl(translation, bookCode, chapterNo)
        )))
    );
}