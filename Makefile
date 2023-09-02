include $(TOPDIR)/rules.mk

PKG_NAME:=webdogcom
PKG_VERSION=v0.0.6
PKG_RELEASE:=1

PKG_MAINTAINER:=1v7w <gascd11@163.com>
PKG_LICENSE:=AGPL-3.0
PKG_LICENSE_FILES:=LICENSE

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/Guyiiyu/webdogcom
PKG_SOURCE_VERSION:=fd29d545be23d9f8c78d821f30755a5aa2d20ec5

PKG_SOURCE_SUBDIR:=$(PKG_NAME)
PKG_SOURCE:=$(PKG_SOURCE_SUBDIR).tar.gz
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_SOURCE_SUBDIR)
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/webdogcom
	SECTION:=net
	CATEGORY:=Network
	TITLE:=webdogcom for OpenWRT
	URL:=https://github.com/Guyiiyu/webdogcom
endef

define Package/webdogcom/description
	webdogcom implementation of Dr.com in web authentication.
endef

MAKE_FLAGS += \
	-C $(PKG_BUILD_DIR)

define Package/webdogcom/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/webdogcom $(1)/usr/bin/webdogcom
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_BIN) ./files/webdogcom.conf $(1)/etc/webdogcom.conf
endef

$(eval $(call BuildPackage,webdogcom))