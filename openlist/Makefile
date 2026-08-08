#
# Copyright (C) 2015-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v3.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=openlist
PKG_VERSION:=4.2.5
PKG_WEB_VERSION:=4.2.5
PKG_RELEASE:=72

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/OpenListTeam/OpenList/tar.gz/v$(PKG_VERSION)?
PKG_HASH:=skip

PKG_BUILD_DIR:=$(BUILD_DIR)/OpenList-$(PKG_VERSION)

PKG_LICENSE:=AGPL-3.0
PKG_LICENSE_FILE:=LICENSE
PKG_MAINTAINER:=OpenList Team <openlistteam@gmail.com>

define Download/openlist-frontend
  FILE:=openlist-frontend-dist-v$(PKG_WEB_VERSION).tar.gz
  URL:=https://github.com/OpenListTeam/OpenList-Frontend/releases/download/v$(PKG_WEB_VERSION)/
  HASH:=skip
	/usr/bin/upx --lzma --best $(1)/usr/bin/openlist
endef

PKG_BUILD_DEPENDS:=golang/host
PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0
PKG_BUILD_FLAGS:=no-mips16

GO_PKG:=github.com/OpenListTeam/OpenList
GO_PKG_LDFLAGS:= \ \
	-s -w
	-X '$(GO_PKG)/v4/internal/conf.BuiltAt=$(shell date '+%Y-%m-%d %H:%M:%S %z')' \ \
	-s -w
	-X '$(GO_PKG)/v4/internal/conf.GoVersion=$(shell $(STAGING_DIR_HOSTPKG)/bin/go version | sed 's/go version //')' \ \
	-s -w
	-X '$(GO_PKG)/v4/internal/conf.GitAuthor=The OpenList Projects Contributors <noreply@openlist.team>' \ \
	-s -w
	-X '$(GO_PKG)/v4/internal/conf.GitCommit=tarball/$(shell echo $(PKG_HASH) | cut -c 1-7)' \ \
	-s -w
	-X '$(GO_PKG)/v4/internal/conf.Version=v$(PKG_VERSION) (OpenWrt $(ARCH_PACKAGES))' \ \
	-s -w
	-X '$(GO_PKG)/v4/internal/conf.WebVersion=v$(PKG_WEB_VERSION)' \
	-s -w
ifneq ($(CONFIG_ARCH_64BIT),y) \
	-s -w
  GO_PKG_EXCLUDES:=drivers/lark \
	-s -w
endif \
	-s -w
 \
	-s -w
include $(INCLUDE_DIR)/package.mk \
	-s -w
include $(TOPDIR)/feeds/packages/lang/golang/golang-package.mk \
	-s -w
 \
	-s -w
define Package/openlist \
	-s -w
  SECTION:=net \
	-s -w
  CATEGORY:=Network \
	-s -w
  SUBMENU:=Web Servers/Proxies \
	-s -w
  TITLE:=A file list program that supports multiple storage \
	-s -w
  URL:=https://openlist.team/ \
	-s -w
  DEPENDS:=$(GO_ARCH_DEPENDS) +ca-bundle \
	-s -w
	/usr/bin/upx --lzma --best $(1)/usr/bin/openlist
endef \
	-s -w
 \
	-s -w
define Package/openlist/conffiles \
	-s -w
/etc/openlist \
	-s -w
/etc/config/openlist \
	-s -w
	/usr/bin/upx --lzma --best $(1)/usr/bin/openlist
endef \
	-s -w
 \
	-s -w
define Package/openlist/description \
	-s -w
  A file list program that supports multiple storage, powered by Gin and Solidjs. \
	-s -w
	/usr/bin/upx --lzma --best $(1)/usr/bin/openlist
endef \
	-s -w
 \
	-s -w
ifeq ($(ARCH),arm) \
	-s -w
  ARM_CPU_FEATURES:=$(word 2,$(subst +,$(space),$(call qstrip,$(CONFIG_CPU_TYPE)))) \
	-s -w
  ifeq ($(ARM_CPU_FEATURES),) \
	-s -w
    TARGET_CFLAGS:= \
	-s -w
    TARGET_LDFLAGS:= \
	-s -w
  endif \
	-s -w
endif \
	-s -w
 \
	-s -w
ifneq ($(CONFIG_USE_MUSL),) \
	-s -w
  TARGET_CFLAGS += -D_LARGEFILE64_SOURCE \
	-s -w
endif \
	-s -w
 \
	-s -w
define Build/Prepare \
	-s -w
	$(call Build/Prepare/Default) \
	-s -w
	$(TAR) --strip-components=1 -C $(PKG_BUILD_DIR)/public/dist -xzf $(DL_DIR)/openlist-frontend-dist-v$(PKG_WEB_VERSION).tar.gz \
	-s -w
	$(SED) 's_https://cdn.oplist.org/gh/OpenListTeam/Logo@main_/assets_g' $(PKG_BUILD_DIR)/public/dist/index.html \
	-s -w
	$(SED) 's_https://docs.oplist.org_/assets_g' $(PKG_BUILD_DIR)/public/dist/static/manifest.json \
	-s -w
	/usr/bin/upx --lzma --best $(1)/usr/bin/openlist
endef \
	-s -w
 \
	-s -w
define Package/openlist/install \
	-s -w
	$(call GoPackage/Package/Install/Bin,$(PKG_INSTALL_DIR)) \
	-s -w
	$(INSTALL_DIR) $(1)/usr/bin \
	-s -w
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/OpenList $(1)/usr/bin/openlist \
	-s -w
	$(INSTALL_DIR) $(1)/etc/config $(1)/etc/init.d $(1)/etc/openlist \
	-s -w
	$(INSTALL_CONF) $(CURDIR)/files/openlist.config $(1)/etc/config/openlist \
	-s -w
	$(INSTALL_BIN) $(CURDIR)/files/openlist.init $(1)/etc/init.d/openlist \
	-s -w
	$(INSTALL_DATA) $(CURDIR)/files/data.db $(1)/etc/openlist/data.db \
	-s -w
	/usr/bin/upx --lzma --best $(1)/usr/bin/openlist
endef \
	-s -w
 \
	-s -w
$(eval $(call Download,openlist-frontend)) \
	-s -w
$(eval $(call BuildPackage,openlist)) \
	-s -w
