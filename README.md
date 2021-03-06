# Nginx Latest + PHP (5.6, 7.3) + MySql 5.7 + MailHog + Redis with Redismin + PHPCS
You need to set all environment variables to use these contianers:  
- **APPLICATION** should be _wordpress_ or _magento_. Load pre-defined nginx config files;
- **PHP_VERSION** should be _5.6_, _7.2_ or _7.3_;
- **DOMAIN** should be your local domain;
- **USERNAME** is your local username to use in nginx and php-fpm for file permissions; 
- **HOST_APP_PATH** is the path of app in your machine. Usually is _../_ to place docker folder inside the project folder;
- **DOCKER_DATA_FOLDER** is the path to save persistent docker data;
- **DB_PASSWORD** is the password for the above user for DB;
- **REDISMIN_KEY** is the key provided by redismin to connect to GUI. See more below;
- **HOST_OS** should be _macos_ or _linux_. It's used to define xdebug config. (if using windows, define as _macos_ as docker host works in windows like in mac __=)__)

Create .env file in docker root using templates from _env-templates_ folder. So you can override it with than get back to its original. Ex.:
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

## HELPERS
There are some helper files in ./helpers. These scripts uses .env vars.
- ./helpers/magento2
  - download.sh: download magento from composer to /var/www/html from container;
  - install.sh: install magento using brazilian config and some pre-defined options. Need to have used download.sh or manually downloaded magento 2;
- ./helpers/magento
  - install-n98.sh: install n98-magerun and make runnable ate any lpace only with "n98" command
- ./helpers/wordpress
  - install-wp-phpcs-standard.sh: installs wordpress PHPCS standard and put it into phpcs config
  - install-wpcli.sh: installs wpcli and make it runnabble at any place with "wp" command
- ./helpers/phpunit
  - PHP Unit phar's for inclusion in IDE to make it auto complete
  
## BASE IMAGES
_base_images_ folder contain PHP base images that are pushed to dockerhub and used to create containers.