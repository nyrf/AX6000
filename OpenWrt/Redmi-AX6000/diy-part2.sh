#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate


#echo "设置lan ip"
#lan_ip='192.168.1.2' 
#sed -i "s/192.168.1.1/$lan_ip/g" package/base-files/files/bin/config_generate

#echo "修改时区"
#utc_name='Asia\/Shanghai' 
#sed -i "s/'UTC'/'CST-8'\n   set system.@system[-1].zonename='$utc_name'/g" package/base-files/files/bin/config_generate

#echo "修改机器名称"
#device_name='OpenWrt'
#sed -i "s/OpenWrt/$device_name/g" package/base-files/files/bin/config_generate

#echo "修改wifi名称"
#wifi_name=ysf
#sed -i "s/OpenWrt/$wifi_name/g" package/network/config/wifi-scripts/files/lib/wifi/mac80211.sh

#echo "wifi默认开启"
#sed -i '/set wireless.${name}.disabled/d' package/network/config/wifi-scripts/files/lib/wifi/mac80211.sh

rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 22.x feeds/packages/lang/golang
sed -i '/-linkmode external \\/d' feeds/packages/lang/golang/golang-package.mk