# curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
# sudo apt-get install -y nodejs
# node -v
# npm -v
# git clone https://github.com/RocketChat/hubot-rocketchat-boilerplate
# cd hubot-rocketchat-boilerplate
# npm install
# npm install node-fetch --save
# sudo curl -sSL -o /hubot-rocketchat-boilerplate/.env https://raw.githubusercontent.com/bytetape/rocketchat_chatGPT/main/.env  -C -
# sudo curl -sSL -o /hubot-rocketchat-boilerplate/scripts/script_chatGPT.js https://raw.githubusercontent.com/bytetape/rocketchat_chatGPT/main/script_chatGPT.js  -C - && \
# read -p "请输入openAI API:" API && \
# sudo sed -i "s/YOUR API KEY/$API/g" /hubot-rocketchat-boilerplate/scripts/script_chatGPT.js
# source .env;bin/hubot -a rocketchat > file.all 2>&1 & disown -h
sudo mkdir -p /hubot-rocketchat-boilerplate && \
sudo chmod 755 /hubot-rocketchat-boilerplate && \
cd /hubot-rocketchat-boilerplate && \
sudo git init && \
sudo git remote add origin https://github.com/RocketChat/hubot-rocketchat-boilerplate.git && \
sudo git fetch && \
sudo git checkout -t origin/master && \
sudo npm install && \
sudo npm install node-fetch --save && \
sudo curl -sSL -o .env https://raw.githubusercontent.com/bytetape/rocketchat_chatGPT/main/.env -C - && \
sudo curl -sSL -o scripts/script_chatGPT.js https://raw.githubusercontent.com/bytetape/rocketchat_chatGPT/main/script_chatGPT.js -C - && \
read -p "请输入OpenAI API：" API && \
sudo sed -i "s/YOUR API KEY/$API/g" scripts/script_chatGPT.js && \
source .env && \
sudo bin/hubot -a rocketchat > file.all 2>&1 & disown -h
