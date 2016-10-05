apt-get install build-essential libssl-dev -y
curl https://raw.githubusercontent.com/creationix/nvm/v0.21.0/install.sh | bash
source ~/.nvm/nvm.sh
echo "source ~/.nvm/nvm.sh" >> .bashrc 

apt-get install apt-transport-https ca-certificates
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" >> /etc/apt/sources.list.d/docker.list
apt-get update
apt-get install docker-engine

curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/dc
chmod +x /usr/local/bin/dc
