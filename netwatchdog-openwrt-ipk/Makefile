include $(TOPDIR)/rules.mk

PKG_NAME:=netwatchdog
PKG_VERSION:=1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/netwatchdog
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Monitoring
  TITLE:=PPPoE watchdog and WAN auto repair
  DEPENDS:=+luci-base
endef

define Package/netwatchdog/description
  自动检查PPPoE连接是否可用，不可用时自动重启WAN接口
endef

define Build/Compile
endef

define Package/netwatchdog/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/netwatchdog.init $(1)/etc/init.d/netwatchdog
	$(INSTALL_DIR) $(1)/root
	$(INSTALL_BIN) ./files/net_check.sh $(1)/root/net_check.sh
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
	$(INSTALL_BIN) ./luasrc/controller/netwatchdog.lua $(1)/usr/lib/lua/luci/controller/netwatchdog.lua
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi
	$(INSTALL_BIN) ./luasrc/model/cbi/netwatchdog.lua $(1)/usr/lib/lua/luci/model/cbi/netwatchdog.lua
endef

$(eval $(call BuildPackage,netwatchdog))
