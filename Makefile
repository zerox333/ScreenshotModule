include $(THEOS)/makefiles/common.mk

export TARGET = iphone:clang:11.2:11.0
export ARCHS = arm64e

BUNDLE_NAME = ScreenshotModule
ScreenshotModule_BUNDLE_EXTENSION = bundle
ScreenshotModule_FILES = ScreenshotModule.m
ScreenshotModule_PRIVATE_FRAMEWORKS = ControlCenterUIKit
ScreenshotModule_CFLAGS = -fobjc-arc
ScreenshotModule_INSTALL_PATH = /Library/ControlCenter/Bundles/

after-install::
	# install.exec "killall -9 SpringBoard"

include $(THEOS_MAKE_PATH)/bundle.mk
include $(THEOS_MAKE_PATH)/aggregate.mk
