include(appconfig.pri)

TEMPLATE  = subdirs

SUBDIRS += 3rd
SUBDIRS += appcreator
SUBDIRS += plugins
SUBDIRS += mbtinstaller

plugins.depends += 3rd
plugins.depends += appcreator
mbtinstaller.depends += plugins
