Package/aeonsemi-as21xxx-firmware = $(call Package/firmware-default,Aeonsemi AS21xxx Ethernet PHY firmware,,LICENSE.aeonsemi)
define Package/aeonsemi-as21xxx-firmware/install
	$(INSTALL_DIR) $(1)/lib/firmware/aeonsemi
	$(CP) \
		$(PKG_BUILD_DIR)/aeonsemi/as21x1x_fw.bin \
		$(1)/lib/firmware
ifneq ($(CONFIG_TARGET_airoha_an7581)$(CONFIG_TARGET_airoha_an7583),)
	$(INSTALL_DIR) $(STAGING_DIR_IMAGE)
	cat \
		$(PKG_BUILD_DIR)/aeonsemi/as21x1x_fw.bin \
		> $(STAGING_DIR_IMAGE)/as21x1x_fw.bin
endif
endef

$(eval $(call BuildPackage,aeonsemi-as21xxx-firmware))
