sudo -i
apt-get update && \
apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release && \
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null  && \
apt-get update && \
apt-get install -y docker-ce docker-ce-cli containerd.io && \
systemctl start docker && \
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
sudo chmod +x /usr/local/bin/docker-compose && \
docker --version
docker-compose --version
curl -LJO https://raw.githubusercontent.com/RocketChat/Docker.Official.Image/master/compose.yml && \
sudo docker-compose up -d
