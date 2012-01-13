#include "Paths.h"

#include <QDesktopServices>


QDir Paths::_cacheDir;
QDir Paths::_shareDir;
QDir Paths::_qmlDir;
QDir Paths::_translationsDir;


void Paths::init()
{
    _cacheDir = QDir(QDesktopServices::storageLocation(QDesktopServices::CacheLocation));
    _cacheDir.mkpath(".");

#ifdef DEBUGPATHS
    _shareDir = QDir("share");
    _qmlDir = QDir("qml");
    _translationsDir = QDir("translations");
#else
    _shareDir = QDir(INSTALLPREFIX"/share");
    _qmlDir = QDir(INSTALLPREFIX"/qml");
    _translationsDir = QDir(INSTALLPREFIX"/translations");
#endif
}


QString Paths::cacheDB()
{
    return _cacheDir.filePath("cache.sqlite");
}


QString Paths::nwtDB()
{
    return _shareDir.filePath("nwt.sqlite");
}

QString Paths::boDB()
{
    return _shareDir.filePath("bo.sqlite");
}

QString Paths::blvDB()
{
    return _shareDir.filePath("blv.sqlite");
}

QString Paths::ccarabicDB()
{
    return _shareDir.filePath("ccarabic.sqlite");
}

QString Paths::langsDB()
{
    return _shareDir.filePath("langs.sqlite");
}

QString Paths::dbByCode(const QString& code)
{
    return _shareDir.filePath(code + ".sqlite");
}


QString Paths::qmlMain()
{
    return _qmlDir.filePath("main.qml");
}


QString Paths::script_js()
{
    return _shareDir.filePath("script.js");
}

QString Paths::style_css()
{
    return _shareDir.filePath("style.css");
}

QString Paths::nwt_xslt()
{
    return _shareDir.filePath("nwt.xslt");
}


QString Paths::translationFile(const QString& locale)
{
    return _translationsDir.filePath(QString("meebible_%1").arg(locale));
}
