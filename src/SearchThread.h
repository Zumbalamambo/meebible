#pragma once

#include <QThread>
#include <QList>
#include <QVariant>

class Translation;
class Indexer;
class sqlite3;

class SearchThread: public QThread
{
    Q_OBJECT

    public:
        SearchThread(
            sqlite3* db, Indexer* indexer,
            bool rebuild,
            const Translation* translation, const QString& query,
            int maxResults,
            QObject* parent = 0
        );

    signals:
        void indexRebuilt();
        void finished(QList<QVariant> results);

    protected:
        virtual void run();

    private:
        sqlite3* _db;
        Indexer* _indexer;
        bool _rebuild;
        const Translation* _translation;
        QString _query;
        int _maxResults;
};
