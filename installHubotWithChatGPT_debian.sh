#!/bin/bash

#更新系统软件包
sudo apt update && sudo apt upgrade -y

#安装必要的软件包
sudo apt install curl git -y

#删除旧的代码库并克隆新的代码库
sudo rm -rf /opt/rocketchat_chatGPT
sudo git clone https://github.com/bytetape/rocketchat_chatGPT /opt/rocketchat_chatGPT

#安装依赖包
cd /opt/rocketchat_chatGPT
sudo apt install -y nodejs
sudo apt install -y npm
sudo npm install --only=production
sudo npm install node-fetch --save

# 填写openAI API
read -p "请输入 openAI API:" API </dev/tty && \
sudo sed -i "s/YOUR API KEY/$API/g" /opt/rocketchat_chatGPT/scripts/script_chatGPT.js

# 将 API 密钥替换到配置文件
sudo sed -i "s/YOUR API KEY/$OPENAI_API_KEY/g" /opt/rocketchat_chatGPT/scripts/script_chatGPT.js

# 启动机器人
bash -c "source /opt/rocketchat_chatGPT/.env && cd /opt/rocketchat_chatGPT && chmod +x bin/hubot && source .env && bin/hubot -a rocketchat"
