#!/usr/bin/env bash

# Update Apt
# --------------------
sudo apt-get update

# Install Mysql
# --------------------
sudo apt-get -y mysql-server mysql-client

# Install Apache & PHP
# --------------------
sudo apt-get install -y apache2
sudo apt-get install -y php7.0 libapache2-mod-php7.0 php7.0-cli php7.0-common php7.0-mbstring php7.0-gd php7.0-intl php7.0-xml php7.0-mysql php7.0-mcrypt php7.0-zip

# Delete default apache web dir and symlink mounted vagrant dir from host machine
# --------------------
# sudo rm -rf /var/www/html
# sudo mkdir /vagrant/httpdocs
# sudo ln -fs /vagrant/httpdocs /var/www/html

# Replace contents of default Apache vhost
# --------------------
VHOST=$(cat <<EOF
NameVirtualHost *:8080
Listen 8080
<VirtualHost *:80>
  DocumentRoot "/var/www/html"
  ServerName localhost
  <Directory "/var/www/html">
    AllowOverride All
  </Directory>
</VirtualHost>
<VirtualHost *:8080>
  DocumentRoot "/var/www/html"
  ServerName localhost
  <Directory "/var/www/html">
    AllowOverride All
  </Directory>
</VirtualHost>
EOF
)

echo "$VHOST" > /etc/apache2/sites-enabled/000-default.conf

a2enmod rewrite
sudo service apache2 restart

sudo apt-get -y install build-essential libssl-dev
sudo apt-get -y install build-essential libssl-dev

curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh -o install_nvm.sh

bash install_nvm.sh

source ~/.profile

nvm install 6.10.3

nvm alias default 6.10.3

nvm use default

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get update && sudo apt-get -y install yarn

yarn global add gulp bower

sudo apt-get autoremove