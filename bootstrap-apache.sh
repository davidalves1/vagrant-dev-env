# !/usr/bin/env bash

# Add PHP repository
# --------------------
sudo add-apt-repository ppa:ondrej/php

# Add Yarn list file
# --------------------
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# Update apt-get
# --------------------
sudo apt-get update

echo -e "##### Install base packages #####"
sudo apt-get install -y vim curl build-essential python-software-properties git vim htop

# # For now MySQL must be installed manually
# # echo '##### Install Mysql #####'
# # --------------------
# 
# # Add Mysql 5.7 list file
# wget http://dev.mysql.com/get/mysql-apt-config_0.6.0-1_all.deb
# sudo dpkg -i mysql-apt-config_0.6.0-1_all.deb
# 
# sudo apt-get update
# 
# sudo apt-get install -y -f mysql-server

echo '##### Install Apache #####'
# --------------------
sudo apt-get install -y apache2
sudo chmod -R 777 /var/www

sudo a2enmod rewrite

sudo service apache2 restart

echo '##### Install PHP 7.0 or 5.6 #####'
# --------------------
sudo apt-get install -y php7.0 libapache2-mod-php7.0 php7.0-cli php7.0-common php7.0-mbstring php7.0-gd php7.0-intl php7.0-xml php7.0-mysql php7.0-mcrypt php7.0-zip
# sudo apt-get install -y -f php5.6 libapache2-mod-php5.6 php5.6-cli php5.6-common php5.6-mbstring php5.6-gd php5.6-intl php5.6-xml php5.6-mysql php5.6-mcrypt php5.6-zip

echo '##### Install Node #####'
# --------------------

cd ~
curl -sL https://deb.nodesource.com/setup_7.x -o nodesource_setup.sh

sudo bash nodesource_setup.sh

sudo apt-get update
sudo apt-get install -y nodejs

node -v

npm -v

echo '##### Install Yarn, Gulp and Bower #####'

sudo npm install -g gulp bower

sudo apt-get install -y -f yarn
# --------------------

# # Add MongoDB list file
# # --------------------
# sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
# echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list

# echo '##### Install MongoDB 3.4 #####'
# # --------------------
# sudo apt-get update && sudo apt-get install -y -f mongodb-org

sudo apt-get autoremove

sudo apt-get autoclean