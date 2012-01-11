TEMPLATE = app

QT += core sql network xml xmlpatterns webkit gui declarative

# DEFINES += DEBUGPATHS

nosearch:DEFINES += NOSEARCH
free:DEFINES += FREEVERSION
symbian:DEFINES += SYMBIAN

symbian {
    DEFINES += INSTALLPREFIX=\"$$INSTALLDIR\"
}
else {
    DEFINES += INSTALLPREFIX=\\\"$$INSTALLDIR\\\"
}


TARGET = meebible
target.path = $$INSTALLDIR/bin
INSTALLS += target



CONFIG += console
CONFIG += warn_on
CONFIG -= debug
CONFIG -= app_bundle


LIBS += -lsqlite3
!nosearch:LIBS += -licui18n

!symbian {
    CONFIG += qdeclarative-boostable
    INCLUDEPATH += /usr/include/applauncherd
    LIBS += -lmdeclarativecache
}

HEADERS +=                      \
    src/Language.h              \
    src/Languages.h             \
    src/Translation.h           \
    src/ChapterRequest.h        \
    src/Source.h                \
    src/NWTSource.h             \
    src/NWTranslation.h         \
    src/NWTChapterRequest.h     \
    src/BibleView.h             \
    src/Cache.h                 \
    src/Paths.h                 \
    src/Place.h                 \
    src/EasyXml.h               \
    src/BibleWebPage.h          \
    src/Fetcher.h               \
    src/Utils.h                 \
    src/Settings.h              \
    src/SimpleSource.h          \
    src/SimpleTranslation.h     \
    src/BLVSource2.h            \
    src/BOSource2.h             \
    src/CCArabicSource2.h       \
    src/KJBOSource.h

!nosearch:HEADERS +=            \
    src/SqliteUnicodeSearch.h   \
    src/SearchThread.h

SOURCES +=                      \
    src/main.cpp                \
    src/Language.cpp            \
    src/Languages.cpp           \
    src/Translation.cpp         \
    src/ChapterRequest.cpp      \
    src/Source.cpp              \
    src/NWTSource.cpp           \
    src/NWTranslation.cpp       \
    src/NWTChapterRequest.cpp   \
    src/BibleView.cpp           \
    src/Cache.cpp               \
    src/Paths.cpp               \
    src/Place.cpp               \
    src/EasyXml.cpp             \
    src/BibleWebPage.cpp        \
    src/Fetcher.cpp             \
    src/Settings.cpp            \
    src/SimpleSource.cpp        \
    src/SimpleTranslation.cpp   \
    src/BLVSource2.cpp          \
    src/BOSource2.cpp           \
    src/CCArabicSource2.cpp     \
    src/KJBOSource.cpp

!nosearch:SOURCES +=            \
    src/SqliteUnicodeSearch.cpp \
    src/SearchThread.cpp