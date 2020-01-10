FROM 	debian:buster

#Update the distrib
RUN 	apt-get update && \
		apt-get -y dist-upgrade && \
		apt-get -y autoremove && \
		apt-get -y clean

RUN		apt-get install -y	nginx \
							php7.3-fpm \
							mariadb-server \
							wget \
							vim
#Setting up NGINX
RUN		rm /var/www/html/index.nginx-debian.html

COPY	srcs/localhost.conf /etc/nginx/sites-available/default



#Get Wordpress

COPY	srcs/wordpress /var/www/html/wordpress

#Downloading and Extracting Wordpress
#RUN		wget -nv https://www.wordpress.org/latest.tar.gz

#RUN		tar xzf latest.tar.gz && \
#			mv wordpress /var/www/html && \
#			rm latest.tar.gz


#Get PHPMyAdmin

RUN		wget -nv https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz

RUN		tar xzf phpMyAdmin-5.0.1-english.tar.gz && \
		mv phpMyAdmin-5.0.1-english /var/www/html/phpmyadmin && \
		rm phpMyAdmin-5.0.1-english.tar.gz


#Setup MySQL

COPY	srcs/script.sh /

CMD		sh /script.sh && rm /script.sh && bash
