#!/usr/bin/env bash

# Update Apt
# --------------------
sudo apt-get update

# Install Mysql
# --------------------
sudo apt-get -y mysql-server mysql-client

# Install Nginx & PHP
# --------------------
sudo apt-get -y install nginx
sudo apt-get -y install -y php7.0 php7.0-fpm php7.0-cli php7.0-common php7.0-mbstring php7.0-gd php7.0-intl php7.0-xml php7.0-mysql php7.0-mcrypt php7.0-zip

sudo rm /etc/nginx/sites-available/default
sudo touch /etc/nginx/sites-available/default

sudo cat >> /etc/nginx/sites-available/default <<'EOF'
server {
  listen   80;
  root /usr/share/nginx/html;
  index index.php index.html index.htm;
  # Make site accessible from http://localhost/
  server_name _;
  location / {
    # First attempt to serve request as file, then
    # as directory, then fall back to index.html
    try_files $uri $uri/ /index.html;
  }
  location /doc/ {
    alias /usr/share/doc/;
    autoindex on;
    allow 127.0.0.1;
    deny all;
  }
  # redirect server error pages to the static page /50x.html
  #
  error_page 500 502 503 504 /50x.html;
  location = /50x.html {
    root /usr/share/nginx/html;
  }
  # pass the PHP scripts to FastCGI server listening on /tmp/php7-fpm.sock
  #
  location ~ \.php$ {
    try_files $uri =404;
    fastcgi_split_path_info ^(.+\.php)(/.+)$;
    fastcgi_pass unix:/var/run/php7-fpm.sock;
    fastcgi_index index.php;
    include fastcgi_params;
  }
  # deny access to .htaccess files, if Apache's document root
  # concurs with nginx's one
  #
  location ~ /\.ht {
    deny all;
  }
  ### phpMyAdmin ###
  location /phpmyadmin {
    root /usr/share/;
    index index.php index.html index.htm;
    location ~ ^/phpmyadmin/(.+\.php)$ {
      client_max_body_size 4M;
      client_body_buffer_size 128k;
      try_files $uri =404;
      root /usr/share/;
      # Point it to the fpm socket;
      fastcgi_pass unix:/var/run/php7-fpm.sock;
      fastcgi_index index.php;
      fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
      include /etc/nginx/fastcgi_params;
    }
    location ~* ^/phpmyadmin/(.+\.(jpg|jpeg|gif|css|png|js|ico|html|xml|txt)) {
      root /usr/share/;
    }
  }
  location /phpMyAdmin {
    rewrite ^/* /phpmyadmin last;
  }
  ### phpMyAdmin ###
}
EOF

sudo touch /usr/share/nginx/html/info.php
sudo cat >> /usr/share/nginx/html/info.php <<'EOF'
<?php phpinfo(); ?>
EOF

sudo service nginx restart

sudo service php7-fpm restart

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

sudo apt-get update && sudo apt-get install yarn

yarn global add gulp bower

sudo apt-get autoremove