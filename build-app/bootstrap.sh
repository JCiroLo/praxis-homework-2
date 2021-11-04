#!/usr/bin/env bash

sudo yum install git -y
echo "---------------GIT was installed---------------"

sudo curl -O -L "https://golang.org/dl/go1.15.7.linux-amd64.tar.gz"
sudo tar -C /usr/local -xzf go1.15.7.linux-amd64.tar.gz
sudo mv go /usr/local
echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.profile
echo "export PORT=4001" >> /etc/profile.d/sh.local
source ~/.profile
echo "---------------GO was installed and local variables were assigned---------------"

curl -sL https://rpm.nodesource.com/setup_14.x | sudo bash -
sudo yum install nodejs -y
echo "---------------NODE was installed---------------"

npm install -g @vue/cli -y
npm install @vue/cli-service -g
echo "---------------VUE was installed---------------"

git clone https://github.com/jdmendozaa/vuego-demoapp.git
echo "---------------App was cloned from GIT---------------"

cd vuego-demoapp/server
go build
cp vuego-demoapp /shared
echo "---------------GO server was built---------------"

cd ../spa
sudo echo 'VUE_APP_API_ENDPOINT="http://10.0.0.8:4001/api"' >> .env.production.local
sudo npm install
sudo npm run build
echo "---------------VUE server was built---------------"

tar -czf dist.tar.gz dist
cp dist.tar.gz /shared
echo "---------------Static files were compressed---------------"
