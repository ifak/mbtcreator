exists($$PWD/plugins.config){
  include($$PWD/plugins.config)
}
TEMPLATE  = subdirs

isEmpty(MBT_PLUGIN){
  MBT_PLUGIN = yes
}

isEmpty(DISTEST_PLUGIN){
  DISTEST_PLUGIN = yes
}

isEmpty(IFAK_PLUGIN){
  IFAK_PLUGIN = no
}

contains(DISTEST_PLUGIN, yes){
  SUBDIRS += distest_plugins
}

contains(MBT_PLUGIN, yes){
  SUBDIRS += mbt_plugins
  mbt_plugins.depends += distest_plugins
}

contains(IFAK_PLUGIN, yes){
  SUBDIRS += ifak_plugins
  ifak_plugins.depends += mbt_plugins
}


