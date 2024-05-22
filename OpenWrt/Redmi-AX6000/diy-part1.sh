#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
# cd $WORK_PATH 目录下,先运行的 public.h -> 设备.h -> scripts/feeds install -a
# 必须的文件
#sed -i '$a src-git openwrt_kiddin9 https://github.com/kiddin9/openwrt-packages' feeds.conf.default
#sed -i '$a src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default
sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default

rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 20.x feeds/packages/lang/golang

./scripts/feeds update -a
./scripts/feeds install -a -f -p kenzo
./scripts/feeds install -a -f -p small

# git clone https://github.com/m0eak/luci-app-turboacc-mtk package/luci-app-turboacc-mtk
# sed -i 's#../../luci.mk#$(TOPDIR)/feeds/luci/luci.mk#g' ./package/*/Makefile
# ./scripts/feeds update -i && ./scripts/feeds install -a
