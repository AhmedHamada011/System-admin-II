#Using apt install apache2 server
sudo apt install apache2

#Replace the default index.html content with your own content
sudo echo '<html>
<h1>Hello</h1>
</html>' > /var/www/html/index.html

#install php module for apache2
sudo apt install libapache2-mod-php8.1

#create new Named VirtulHost to serve new php project with special access log 
echo '<VirtualHost *:80>
    ServerName myProject.local
    DocumentRoot /var/www/html/myProject
	ServerAdmin webmaster@localhost
	DocumentRoot "/var/www/html/myProject"
	ErrorLog ${APACHE_LOG_DIR}/error-myProject.log
	CustomLog ${APACHE_LOG_DIR}/access-myProject.log combined
</VirtualHost>' > /etc/apache2/sites-available/myProject.conf

#create simple index.php file for the php site
echo '<?php
echo "Hello";
' > /var/www/html/index.php

#configure /etc/hosts for php site.
echo '127.0.0.1  myProject.local' >> /etc/hosts

#disable directory listing for the new virtualhost

echo '<VirtualHost *:80>
    ServerName myProject.local
    DocumentRoot /var/www/html/myProject
    <Directory>
        Options -Indexes
    </Directory>
	ServerAdmin webmaster@localhost
	DocumentRoot "/var/www/html/myProject"
	ErrorLog ${APACHE_LOG_DIR}/error-myProject.log
	CustomLog ${APACHE_LOG_DIR}/access-myProject.log combined
</VirtualHost>' > /etc/apache2/sites-available/myProject.conf

