#!/usr/bin/env bash
# Installing and configuring ngnix for Airbnb webstatic

#installing nginx
sudo apt-get update
sudo apt-get install nginx -y

#creating respositories if they dont exisit
sudo mkdir -p /data/web_static/releases/test/
sudo mkdir -p /data/web_static/shared/


#creating needed folders
sudo mkdir -p /data/web_static/releases/test/ /data/web_static/shared/

#test html file
echo "
<!DOCTYPE html>
<html>
  <head>
  </head>
  <body>
    Holberton School
  </body>
</html>" | sudo tee /data/web_static/releases/test/index.html

#symbolic link
sudo ln -sf /data/web_static/releases/test/ /data/web_static/current

#changing directory name
sudo chown -R ubuntu:ubuntu /data/

#updating root directory
sudo sed -i '/server_name _;/a \ \tlocation /hbnb_static {\n\t\talias /data/web_static/current;\n\t}\n' /etc/nginx/sites-available/default

#restarting server
sudo service nginx restart
