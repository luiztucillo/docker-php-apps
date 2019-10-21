# Nginx Latest + PHP + MySql 5.7 + MailHog + Redis with Redismin + PHPCS
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

You can have multiple env files for multiple applications, defining where the one to use when starting docker compose. Ex.:  
_docker-compose up -d --env-file wordpress.env_
_docker-compose up -d --env-file magento.env_

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

###N98
This plugin also installs N98. You can run it from anywhere with the command _n98_
