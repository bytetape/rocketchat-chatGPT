#!/bin/bash
#更新系统软件包
sudo apt-get update
sudo apt update && sudo apt upgrade -y

#安装必要的软件包
sudo apt install curl git -y

#删除旧的代码库并克隆新的代码库
sudo rm -rf /opt/rocketchat_chatGPT
sudo git clone https://github.com/bytetape/rocketchat_chatGPT /opt/rocketchat_chatGPT

#安装依赖包
cd /opt/rocketchat_chatGPT
sudo npm install
sudo npm install node-fetch --save
