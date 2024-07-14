#!/bin/bash
set -xe

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
nvm install v20.15.1
nvm use v20.15.1

node -v
npm -v
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install yarn
yarn --version

apt install unzip
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Copy war file from S3 bucket to tomcat webapp folder
aws s3 cp s3://codedeploystack-webappdeploymentbucket-jk05pgxqcofh/dist /usr/local/app/dist --recursive
aws s3 cp s3://codedeploystack-webappdeploymentbucket-jk05pgxqcofh/tsconfig.json /usr/local/app/tsconfig.json
aws s3 cp s3://codedeploystack-webappdeploymentbucket-jk05pgxqcofh/package.json /usr/local/app/package.json

cd /usr/local/app/

sudo yarn
