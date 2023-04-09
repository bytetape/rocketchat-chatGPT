# curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash - && \
# sudo apt-get install -y nodejs && \
# node -v && \
# npm -v && \
# sudo rm -rf hubot-rocketchat-boilerplate && \
# sudo git clone https://github.com/RocketChat/hubot-rocketchat-boilerplate && \
# cd hubot-rocketchat-boilerplate && \
# npm install && \
# npm install node-fetch --save && \
# sudo curl -sSL -o /hubot-rocketchat-boilerplate/.env https://raw.githubusercontent.com/bytetape/rocketchat_chatGPT/main/.env && \
# sudo curl -sSL -o /hubot-rocketchat-boilerplate/scripts/script_chatGPT.js https://raw.githubusercontent.com/bytetape/rocketchat_chatGPT/main/script_chatGPT.js && \
# read -p "请输入openAI API:" API && \
# sudo sed -i "s/YOUR API KEY/$API/g" /hubot-rocketchat-boilerplate/scripts/script_chatGPT.js && \
# source .env;bin/hubot -a rocketchat > file.all 2>&1 & disown -h

# sudo apt-get update && \
# sudo apt update && sudo apt upgrade -y && \
# sudo apt install curl sudo && \
# curl -sL https://deb.nodesource.com/setup_current.x | sudo -E bash - && \
# sudo apt-get install -y nodejs && \
# sudo npm install -g npm && \
# sudo rm -rf hubot-rocketchat-boilerplate && \
# sudo git clone https://github.com/RocketChat/hubot-rocketchat-boilerplate && \
# cd hubot-rocketchat-boilerplate && \
# sudo npm install && \
# sudo npm install node-fetch --save && \
# sudo curl -sSL -o /hubot-rocketchat-boilerplate/.env https://raw.githubusercontent.com/bytetape/rocketchat_chatGPT/main/.env && \
# sudo curl -sSL -o /hubot-rocketchat-boilerplate/scripts/script_chatGPT.js https://raw.githubusercontent.com/bytetape/rocketchat_chatGPT/main/script_chatGPT.js && \
# read -p "请输入 openAI API:" API && \
# sudo sed -i "s/YOUR API KEY/$API/g" /hubot-rocketchat-boilerplate/scripts/script_chatGPT.js && \
# cd .. && \
# source .env && \
# cd hubot-rocketchat-boilerplate && \
# bin/hubot -a rocketchat > file.all 2>&1 & disown -h


sudo apt-get update && \
sudo apt update && sudo apt upgrade -y && \
sudo apt install curl sudo git -y && \
sudo git clone https://github.com/RocketChat/hubot-rocketchat-boilerplate && \
cd hubot-rocketchat-boilerplate && \
sudo npm install && \
sudo npm install node-fetch --save && \
sudo cp example.env .env && \
sudo curl -sSL -o scripts/script_chatGPT.js https://raw.githubusercontent.com/bytetape/rocketchat_chatGPT/main/script_chatGPT.js && \
sudo nano .env #在这里输入openAI API密钥并保存文件
sudo nano scripts/script_chatGPT.js #使用nano编辑器将YOUR API KEY替换为.env文件中的实际API密钥
bin/hubot -a rocketchat > file.all 2>&1 & disown -h
