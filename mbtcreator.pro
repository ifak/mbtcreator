exists($$PWD/mbtcreator.config){
  include($$PWD/mbtcreator.config)
}

include(appconfig.pri)

TEMPLATE  = subdirs

SUBDIRS += 3rd
SUBDIRS += appcreator
SUBDIRS += plugins

plugins.depends += 3rd
plugins.depends += appcreator

isEmpty(MBTINSTALLER){
  MBTINSTALLER = no
}

contains(MBTINSTALLER, yes){
  SUBDIRS += SUBDIRS += mbtinstaller
  mbtinstaller.depends += plugins
}
