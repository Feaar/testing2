#!/bin/bash
# Install steamboosthours script on debian or ubuntu server
# requires root

if [[ "$USER" != 'root' ]]; then
  echo "Sorry, you need to run this as as root"
  exit
fi

apt-get update
apt-get upgrade -y
apt-get install -y git wget tar build-essential libssl-dev

cd ~
mkdir tmp
cd tmp

# Install iojs
wget https://iojs.org/dist/v1.6.1/iojs-v1.6.1-linux-x64.tar.gz
tar --strip-components 1 -xzvf iojs-v* -C /usr/local

# Clone steamboosthours repository
git clone https://github.com/Feaar/testing.git ~/steamboosthours
cd ~/steamboosthours

# Run npm install
npm install .
npm install -g coffee-script forever

# Finished
echo "~ Installation finished ~"
echo "Run 'coffee users.coffee' to add accounts"
echo "Run 'forever start -c coffee boost.coffee' to start boosting"
