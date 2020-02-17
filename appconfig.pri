APP_NAME = "MBT Creator"
APP_VERSION = 0.16.6
APP_LOGO = "images/mbtcreator_128.png"
APP_WELCOME_LOGO = "images/mbtcreator_64.png"
APP_VERSION_LOGO = "images/mbtcreator_128.png"
APP_WINDOW_LOGO = "images/mbtcreator_32.png"

IDE_APP_PATH = $$shadowed($$PWD)/build
APP_PLUGINS_PATH = $$IDE_APP_PATH/plugins/
IDE_APP_TARGET = "mbtcreator"

os*:ICON = $${PWD}/images/mbtcreator.ico
win*:RC_ICONS = $${PWD}/images/mbtcreator.ico

QTC_PLUGIN_PATHS += \
    $${PWD}/appcreator/src/plugins \
    $${PWD}/plugins/mbt_plugins \
    $${PWD}/plugins/distest_plugins

INCLUDEPATH *= $$QTC_PLUGIN_PATHS

win32{
  copyimages.commands = IF NOT EXIST $$shell_path($$IDE_APP_PATH/bin/images) ( $(COPY_DIR) \"$$shell_path($$PWD/images)\" \"$$shell_path($$IDE_APP_PATH/bin/images)\" )
  QMAKE_EXTRA_TARGETS += copyimages
  POST_TARGETDEPS += copyimages
} else {
  copyimages.commands = $(COPY_DIR) $$PWD/images $$IDE_APP_PATH/bin/
  QMAKE_EXTRA_TARGETS += copyimages
  POST_TARGETDEPS += copyimages
}
