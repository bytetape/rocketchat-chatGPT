# #!/bin/bash
# sudo apt-get update
# sudo apt update && sudo apt upgrade -y
# sudo apt install curl sudo git -y
# sudo rm -rf rocketchat_chatGPT
# sudo git clone https://github.com/bytetape/rocketchat_chatGPT
# sudo npm install
# sudo npm install node-fetch --save
# read -p "请输入 openAI API:" API && \
# sudo sed -i "s/YOUR API KEY/$API/g" ~/rocketchat_chatGPT/scripts/script_chatGPT.js
# cd ~/rocketchat_chatGPT && chmod +x bin/hubot && source .env && bin/hubot -a rocketchat


#!/bin/bash

# 更新系统软件包
sudo apt-get update
sudo apt update && sudo apt upgrade -y

# 安装必要的软件包
sudo apt install curl git -y

# 删除旧的代码库并克隆新的代码库
sudo rm -rf /opt/rocketchat_chatGPT
sudo git clone https://github.com/bytetape/rocketchat_chatGPT /opt/rocketchat_chatGPT

# # 安装依赖包
# cd /opt/rocketchat_chatGPT
# sudo npm install
# sudo npm install node-fetch --save

# # 替换 API 密钥
# read -p "请输入 openAI API:" API
# sudo sed -i "s/YOUR API KEY/$API/g" /opt/rocketchat_chatGPT/scripts/script_chatGPT.js

# # 启动机器人
# source /opt/rocketchat_chatGPT/.env
# cd /opt/rocketchat_chatGPT && bin/hubot -a rocketchat
