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


sudo apt-get update
sudo apt update && sudo apt upgrade -y
sudo apt install curl sudo git -y
sudo rm -rf hubot-rocketchat-boilerplate
sudo git clone https://github.com/RocketChat/hubot-rocketchat-boilerplate
cd hubot-rocketchat-boilerplate
sudo npm install
sudo npm install mkdirp@latest
sudo npm install connect@latest
sudo npm install coffeescript@latest
sudo npm install node-fetch --save
sudo curl -sSL -o .env https://raw.githubusercontent.com/bytetape/rocketchat_chatGPT/main/.env
sudo curl -sSL -o scripts/script_chatGPT.js https://raw.githubusercontent.com/bytetape/rocketchat_chatGPT/main/script_chatGPT.js
read -p "请输入 openAI API:" API
sudo sed -i "s/YOUR API KEY/$API/g" /hubot-rocketchat-boilerplate/scripts/script_chatGPT.js
bin/hubot -a rocketchat > file.all 2>&1 & disown -h
