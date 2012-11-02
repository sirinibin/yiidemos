#!/bin/sh
# update & install basic packages #
# Created by Amit Karwal #
##########################################################

# Create a root directory for leaveagift.com in nginx root folder.
sudo mkdir /usr/share/nginx/www/leaveagift.com

# Virtual Host configurations.
sudo echo -e "server {\n\n  server_name leaveagift.com;\n  root   /usr/share/nginx/www/leaveagift.com;\n  access_log /var/log/nginx/leaveagift.com_access.log;\n  error_log /var/log/nginx/leaveagift.com_error.log;\n\n  location / {\n  if (!-e \$request_filename){\n  rewrite ^(.*)$ /index.php;\n  }\n\n  index  index.php;\n}\n location ~ \.php$ {\n expires off;\n include /etc/nginx/fastcgi_params;\n fastcgi_pass  127.0.0.1:9000;\n fastcgi_index index.php;\n fastcgi_param  SCRIPT_FILENAME  \$document_root\$fastcgi_script_name;\n }\n}" >> /etc/nginx/sites-available/leaveagift.com

# Create Symbolic link for leaveagift.com
sudo ln -s /etc/nginx/sites-available/leaveagift.com /etc/nginx/sites-enabled/leaveagift.com

# Restart Nginx server
sudo service nginx restart

# Restart php5-fpm
sudo service php5-fpm restart
