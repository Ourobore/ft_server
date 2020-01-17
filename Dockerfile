FROM 	debian:buster

#=========== Updating the distrib ======
RUN 	apt-get update && \
		apt-get -y dist-upgrade && \
		apt-get -y autoremove && \
		apt-get -y clean

RUN		apt-get install -y	nginx \
							php7.3-fpm \
							php7.3-mysql \
							mariadb-server \
							openssl \
							wget \
							vim


#============= Setting up NGINX ==========
RUN		rm /var/www/html/index.nginx-debian.html

COPY	srcs/localhost.conf /etc/nginx/sites-available/default


#============= Setting up Wordpress ======

#Downloading and Extracting Wordpress
#RUN        wget -nv https://www.wordpress.org/latest.tar.gz

#RUN        tar xzf latest.tar.gz && \
#           mv wordpress /var/www/html && \
#           rm latest.tar.gzi

COPY	srcs/wordpress /var/www/html/wordpress

COPY	srcs/wp-config.php /var/www/html/wordpress/wp-config.php


#============= Setting up PHPMyAdmin ======
RUN		wget -nv https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz

RUN		tar xzf phpMyAdmin-5.0.1-english.tar.gz && \
		mv phpMyAdmin-5.0.1-english /var/www/html/phpmyadmin && \
		rm phpMyAdmin-5.0.1-english.tar.gz

RUN     echo "extension=mysqli.so" >> /etc/php/7.3/fpm/php.ini

RUN		echo "\$cfg['ForceSSL'] = true;" > /var/www/html/phpmyadmin/config.inc.php


#S============= Setting up database =======
RUN		service mysql start && \
		mysql -e "CREATE USER 'username'@'localhost' IDENTIFIED BY 'password';" && \
		mysql -e "CREATE DATABASE wordpress" && \
		mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'username'@'localhost' IDENTIFIED BY 'password';"


#============= Setting up SSL =============
RUN		openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /server.key -out /server.crt -subj "/C=RD/ST=Nowhere/L=Nowhere/O=Nobody/OU=Nobody/CN=localhost"

RUN		mv /server.crt /etc/ssl/server.crt && mv /server.key /etc/ssl/server.key 


#============= Launching the services =====
CMD		service mysql start && \
		service php7.3-fpm start && \
		service nginx start && \
		bash

