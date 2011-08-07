QT       += core sql network xml xmlpatterns webkit gui declarative

TARGET = meebible
CONFIG   += console
CONFIG   -= app_bundle

TEMPLATE = app

LIBS += -licutu -lsqlite3


SOURCES += main.cpp \
    TranslationsList.cpp \
    Language.cpp \
    Languages.cpp \
    Translation.cpp \
    ChapterRequest.cpp \
    Source.cpp \
    NWTSource.cpp \
    NWTranslation.cpp \
    NWTChapterRequest.cpp \
    BibleView.cpp \
    Cache.cpp \
    Paths.cpp \
#    MainWindow.cpp \
    Place.cpp \
#    TranslationDialog.cpp \
    BOSource.cpp \
    BORusTranslation.cpp \
    BOChapterRequest.cpp \
    EasyXml.cpp \
    BibleWebPage.cpp \
    Fetcher.cpp \
#    FetcherDialog.cpp \
    SqliteUnicodeSearch.cpp \
    SearchThread.cpp

HEADERS += \
    TranslationsList.h \
    Language.h \
    Languages.h \
    Translation.h \
    ChapterRequest.h \
    Source.h \
    NWTSource.h \
    NWTranslation.h \
    NWTChapterRequest.h \
    BibleView.h \
    Cache.h \
    Paths.h \
#    MainWindow.h \
    Place.h \
#    TranslationDialog.h \
    BOSource.h \
    BORusTranslation.h \
    BOChapterRequest.h \
    EasyXml.h \
    BibleWebPage.h \
    Fetcher.h \
#    FetcherDialog.h \
    Utils.h \
    SqliteUnicodeSearch.h \
    SearchThread.h

RESOURCES += \
    meebible.qrc

OTHER_FILES += \
    createlangs.sql \
    createnwt.sql \
    nwt.xslt \
    style.css \
    createborus.sql \
    bo.xslt \
    script.js \
    qml/main.qml \
    qtc_packaging/debian_harmattan/rules \
    qtc_packaging/debian_harmattan/README \
    qtc_packaging/debian_harmattan/copyright \
    qtc_packaging/debian_harmattan/control \
    qtc_packaging/debian_harmattan/compat \
    qtc_packaging/debian_harmattan/changelog

unix:!symbian:!maemo5 {
    target.path = /opt/meebible/bin
    INSTALLS += target
}
