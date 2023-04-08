# 在开源聊天工具中使用chatGPT
<table style="border-collapse: collapse;">
  <tr>
    <td style="border: none;"><img src="https://user-images.githubusercontent.com/130202349/230718521-517d13eb-7cad-41f4-8dbb-e7e7ce3206e1.png" height="200"></td>
    <td style="border: none;"><img src="https://user-images.githubusercontent.com/130202349/230718323-9d70a89a-6830-46ca-8240-9c1df15ca5bd.jpg" height="200"></td>
    <td style="border: none;"><img src="https://user-images.githubusercontent.com/130202349/230718174-0c408dc3-d8fb-4e72-a581-f898b1c06bc9.png" height="200"></td>
  </tr>
</table>

这是通过使用hubot机器人使用chatGPT API来实现在rocketchat中使用chatGPT的方法。

需要使用境外服务器（当然也可以使用境内rocketchat+境外hubot两台服务器），下面以Debian系统安装为例。

## 1. 安装Docker Compose
```
sudo -i
apt-get update
```
安装必要的软件包：
```
apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release
```
添加 Docker 的 GPG 密钥：
```
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```
添加 Docker 的 APT 源：
```
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```
安装 Docker：
```
apt-get install -y docker-ce docker-ce-cli containerd.io
```
启动 Docker 服务：
```
systemctl start docker
```
安装 Docker Compose：
```
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```
赋予执行权限：
```
sudo chmod +x /usr/local/bin/docker-compose
```
验证 Docker 和 Docker Compose 是否成功安装：
```
docker --version
docker-compose --version
```
如果有显示docker和docker compose的版本号即代表安装成功！如下所示：
```
root@VM-4-2-debian:~# docker --version
Docker version 23.0.3, build 3e7cbfd
root@VM-4-2-debian:~# docker-compose --version
Docker Compose version v2.17.2
```
## 2. 安装rocketchat
1. 直接使用官方yml文件安装
```
curl -LJO https://raw.githubusercontent.com/RocketChat/Docker.Official.Image/master/compose.yml
sudo docker-compose up -d
```
2. 安装成功后即可使用**http://[你的服务器IP]:3000**进入rocketchat界面了。

3. 用自己邮箱注册rocketchat账号后，记得回到邮箱点Verify registration！

4. 创建一个机器人，命名为“chatGPT”, 密码chatGPT，这里名字和密码和下一步的.env文件要保持一致，Roles选择bot。
## 3. 安装hubot机器人
安装Node.js和npm
```
curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
sudo apt-get install -y nodejs
node -v
npm -v
```
安装hubot机器人
```
git clone https://github.com/RocketChat/hubot-rocketchat-boilerplate
cd hubot-rocketchat-boilerplate
npm install
npm install node-fetch --save
```
hubot-rocketchat-boilerplate目录下创建.env文件
```
nano .env
```
粘贴下面内容
```
export ROCKETCHAT_USER=chatGPT
export ROCKETCHAT_PASSWORD=chatGPT
export ROCKETCHAT_ROOM=general
export ROCKETCHAT_AUTH=password
export ROCKETCHAT_URL=localhost:3000
export ROCKETCHAT_USE_SSL=false
export RESPOND_TO_DM=true
```
保存文件
Ctrl + X, Y, Enter

下载script_chatGPT.js
进入/hubot-rocketchat-boilerplate/scripts路径下
```
cd scripts
```
使用wget命令从GitHub下载.js文件
```
sudo wget https://raw.githubusercontent.com/bytetape/rocketchat_chatGPT/main/script_chatGPT.js
```
修改API_KEY
```
vim script_chatGPT.js
```
1. 输入 i
2. 把第5行的YOUR API KEY修改成自己的API_KEY
```
如const API_KEY = "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";
```
3. 完成修改后按ESC，输入:wq

返回hubot-rocketchat-boilerplate路径下，启动hubot
```
cd ..
source .env
bin/hubot -a rocketchat
```
待完成启动（一般几秒钟）如果一切顺利的话，可以回到rocketchat页面中尝试和chatGPT对话了。

需要注意的是如果我们关闭了SSH客户端，此时正在运行的进程也会中断。解决方法就是把进程转入后台，操作如下：

先使用Ctrl+C终止进程。
```
source .env;bin/hubot -a rocketchat > file.all 2>&1 & disown -h
```
后续如果需要关闭进程可用下面命令找到后台进程，并kill
```
ps -ef | grep hubot
kill <进程号>
```
