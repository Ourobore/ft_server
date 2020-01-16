#Starting services
service nginx start && \
service php7.3-fpm start && \
service mysql start

#Enabling mysqli
echo extension=mysqli.so >> /etc/php/7.3/fpm/php.ini

#Setting up database

mysql -e "CREATE USER 'username'@'localhost' IDENTIFIED BY 'password';"
mysql -e "CREATE DATABASE wordpress"

mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'username'@'localhost' IDENTIFIED BY 'password';"
service mysql restart

