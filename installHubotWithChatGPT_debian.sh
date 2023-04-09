#!/bin/bash
sudo apt-get update
sudo apt update && sudo apt upgrade -y
sudo apt install curl sudo git -y
sudo rm -rf rocketchat_chatGPT
sudo git clone https://github.com/bytetape/rocketchat_chatGPT
sudo npm install
sudo npm install node-fetch --save
read -p "请输入 openAI API:" API && \
sudo sed -i "s/YOUR API KEY/$API/g" ~/rocketchat_chatGPT/scripts/script_chatGPT.js
cd ~/rocketchat_chatGPT && chmod +x bin/hubot && source .env && bin/hubot -a rocketchat
