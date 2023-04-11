#!/bin/bash

#Using apt , install nginx
sudo apt install nginx

#Enable port 80 on the firewall 
sudo ufw allow 80/tcp

#Create index.html file on root directory  of the server section and test it
sudo systemctl start nginx
sudo echo '</html>
    <body>
            <h1>Hello world</h1>
    </body>
</html>' > /var/www/html/index.html

#Install php-fpm package 
sudo apt install php8.1-fpm

#configure main site to enable php-fpm
sudo nano /etc/nginx/sites-available/default
# add this lines
        location ~ \.php$ {
              include snippets/fastcgi-php.conf;
              fastcgi_pass unix:/run/php/php8.1-fpm.sock;
        }


#create index.php file and test it.
echo '<?php
    echo "Hello world"; ' > /var/www/html/index.php

