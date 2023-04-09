curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
sudo apt-get install -y nodejs
node -v
npm -v
git clone https://github.com/RocketChat/hubot-rocketchat-boilerplate
cd hubot-rocketchat-boilerplate
npm install
npm install node-fetch --save
curl -sSL -o /hubot-rocketchat-boilerplate/.env https://raw.githubusercontent.com/bytetape/rocketchat_chatGPT/main/.env
curl -sSL -o /hubot-rocketchat-boilerplate/scripts/script_chatGPT.js https://raw.githubusercontent.com/bytetape/rocketchat_chatGPT/main/script_chatGPT.js && \
read -p "请输入openAI API:" API && \
sed -i "s/YOUR API KEY/$API/g" /hubot-rocketchat-boilerplate/scripts/script_chatGPT.js
source .env;bin/hubot -a rocketchat > file.all 2>&1 & disown -h
