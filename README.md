# Nginx Latest + PHP (5.6, 7.3) + MySql 5.7 + MailHog + Redis with Redismin + PHPCS
You need to set all environment variables to use these contianers:  
- **APPLICATION** should be _wordpress_ or _magento_;
- **PHP_VERSION** should be _5.6_ or _7.3_;
- **DOMAIN** should be your local domain;
- **USERNAME** is your local username to use in nginx and php-fpm for file permissions; 
- **APP_PATH** is the path of app in container. Usually is _/var/www/html_;
- **HOST_APP_PATH** is the path of app in your machine. Usually is _../_ to place docker folder inside the project folder;
- **DB_LOCAL_VOLUME** is the path to save DB volume. It's useful to persist database data;
- **DB_NAME** is the default schema name for this application. It's created when the database container is created;
- **DB_USER** is the user for the DB;
- **DB_PASSWORD** is the password for the above user for DB;
- **REDISMIN_KEY** is the key provided by redismin to connect to GUI. See more below;

The .env file is the sample. We have a sample for magento _(.env.magento.sample)_ and one for wordpress _(.env.wordpress.sample)_
The default one _(.env)_ is a copy from wordpress. So you can override it with than get back to its original. Ex.:
To run __wordpress__ execute: _cp env-templates/wordpress.env ../.env && docker-compose up -d --build_  
To run __magento__ execute: _cp env-templates/magento.env .env && docker-compose up -d --build_  

Or you can override some environment var directly. Ex.:  
_docker-compose up -d -e APPLICATION=magento -e PHP_VERSION=5.6_

### CONFIG
Inside containers, database host is **always** _mysql_.

### REDISMIN
[Redismin](https://www.redsmin.com/) is a web GUI for Redis. See more in 

### Setting local domain
You can configure more hosts mannually in _images/conf/conf.d/defaul.conf_

### PHP Code Sniffer
This docker installs PHPCS with [Zifius](https://github.com/Zifius/Magizendo) standard to use with Magento 1.  
To configure in PHPSTORM:
- Preferences
- Language and Frameworks > PHP > Code Sniffer
- Set __"Configuration"__ to __"Local"__
- Click on __"..."__ icon
- Set __"PHP Code Sniffer Path"__ to the file __"phpcs.sh"__ inside docker folder then click __"Validate"__

### N98
This plugin also installs N98. You can run it from anywhere with the command _n98_

## SSL
### Generate certificates
Use este https://kifarunix.com/how-to-create-self-signed-ssl-certificate-with-mkcert-on-ubuntu-18-04/ para criar e confiar em um certificado auto-assinado.
 