# SPDX-License-Identifier: GPL-3.0-only
#
# Copyright (C) 2021-2025  sirpdboy  <herboy2008@gmail.com>
# 
# This is free software, licensed under the Apache License, Version 2.0 .
#
#

include $(TOPDIR)/rules.mk

VER_MAIN:=3.0.0
VER_BETA:=beta8
SUB_FOLDER:=$(VER_MAIN)_wanji

PKG_NAME:=lucky
PKG_VERSION:=$(VER_MAIN)
PKG_RELEASE:=1
PKGARCH:=all 

ifeq ($(ARCH),mipsel)
	LUCKY_ARCH:=mipsle_softfloat
endif
ifeq ($(ARCH),mips)
	LUCKY_ARCH:=mips_softfloat
endif
ifeq ($(ARCH),i386)
	LUCKY_ARCH:=i386
endif
ifeq ($(ARCH),x86_64)
	LUCKY_ARCH:=x86_64
endif
ifeq ($(ARCH),arm)
	ifeq ($(BOARD),bcm53xx)
		LUCKY_ARCH:=armv6
	else
		LUCKY_ARCH:=armv7
	endif
endif
ifeq ($(BOARD),bcm53xx)
	LUCKY_ARCH:=armv6
ifeq ($(word 2,$(subst +,$(space),$(call qstrip,$(CONFIG_CPU_TYPE)))),)
	LUCKY_ARCH:=armv5
endif
endif
ifeq ($(BOARD),kirkwood)
	LUCKY_ARCH:=armv5
endif
ifeq ($(ARCH),aarch64)
	LUCKY_ARCH:=arm64
endif

RELEASE_URL:=https://release.66666.host
RELEASE_DIR:=v$(VER_MAIN)$(VER_BETA)/$(SUB_FOLDER)
FILE_NAME:=$(PKG_NAME)_$(VER_MAIN)_Linux_$(LUCKY_ARCH)_wanji.tar.gz

PKG_LICENSE:=GPL-3.0-only
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=GDY666 <gdy666@foxmail.com>

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_HASH:=skip

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
	SECTION:=net
	CATEGORY:=Network
	TITLE:=Lucky gdy
	DEPENDS:=@(i386||x86_64||arm||aarch64||mipsel||mips)
	URL:=https://github.com/gdy666/lucky
endef

define Package/$(PKG_NAME)/description
  Main functions of Lucky: ipv4/ipv6 portforward,ddns,IOT wake on lan ,reverse proxy and more...
endef

define Build/Prepare
	[ ! -f $(PKG_BUILD_DIR)/$(FILE_NAME) ] && wget $(RELEASE_URL)/$(RELEASE_DIR)/$(FILE_NAME) -O $(PKG_BUILD_DIR)/$(FILE_NAME)
	tar -xzvf $(PKG_BUILD_DIR)/$(FILE_NAME) -C $(PKG_BUILD_DIR)
endef

define Package/$(PKG_NAME)/conffiles
/etc/config/lucky
/etc/lucky/*
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/init.d/
	$(INSTALL_DIR) $(1)/etc/config/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/lucky $(1)/usr/bin/lucky
	$(INSTALL_BIN) $(CURDIR)/files/luckyarch.bin $(1)/usr/bin/luckyarch
	$(INSTALL_BIN) ./files/lucky.init $(1)/etc/init.d/lucky
	$(INSTALL_CONF) $(CURDIR)/files/lucky.config $(1)/etc/config/lucky
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
