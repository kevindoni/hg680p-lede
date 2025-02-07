#!/bin/bash
#=================================================
# File name: preset-clash-core.sh
# Usage: <preset-clash-core.sh $platform> | example: <preset-clash-core.sh armv8>
# System Required: Linux
# Version: 1.0
# Lisence: MIT
# Author: SuLingGG
# Blog: https://mlapp.cn
#=================================================

clash_core_path="$(pwd)/amlogic-s9xxx/common-files/files/etc/openclash/core"

mkdir -p $clash_core_path

open_clash_premium_url=$(curl -sL https://api.github.com/repos/Dreamacro/clash/releases/tags/premium | grep /clash-linux-$1 | sed 's/.*url\": \"//g' | sed 's/\"//g')
open_clash_main_url=$(curl -sL https://api.github.com/repos/vernesong/OpenClash/releases/tags/Clash | grep /clash-linux-$1 | sed 's/.*url\": \"//g' | sed 's/\"//g')
# offical_clash_main_url=$(curl -sL https://api.github.com/repos/Dreamacro/clash/releases/tags/v1.3.5 | grep /clash-linux-$1 | sed 's/.*url\": \"//g' | sed 's/\"//g')
clash_tun_url=$(curl -sL https://api.github.com/repos/vernesong/OpenClash/releases/tags/TUN-Premium | grep /clash-linux-$1 | sed 's/.*url\": \"//g' | sed 's/\"//g')
clash_game_url=$(curl -sL https://api.github.com/repos/vernesong/OpenClash/releases/tags/TUN | grep /clash-linux-$1 | sed 's/.*url\": \"//g' | sed 's/\"//g')

wget -qO- $open_clash_premium_url | gunzip -c > $clash_core_path/clash
wget -qO- $open_clash_main_url | tar xOvz > $clash_core_path/clash_original
# wget -qO- $offical_clash_main_url | gunzip -c > $clash_core_path/clash
wget -qO- $clash_tun_url | gunzip -c > $clash_core_path/clash_tun
wget -qO- $clash_game_url | tar xOvz > $clash_core_path/clash_game

chmod +x $clash_core_path/clash*
