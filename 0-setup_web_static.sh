#!/usr/bin/env bash
<<<<<<< HEAD
# Installing and configuring ngnic for Airbnb webstatic

#installing nginx
sudo apt-get update
sudo apt-get install nginx -y

#creating respositories if they dont exisit
sudo mkdir -p /data/web_static/releases/test/
sudo mkdir -p /data/web_static/shared/

#test html file
echo "<!DOCTYPE html>
=======
#Bash script that sets up your web servers for the deployment of web_static

#installing and updating nginx
sudo apt install nginx
sudo apt update nginx -y

#creating needed folders
sudo mkdir -p /data/web_static/releases/test/ /data/web_static/shared/

#dummy html file
sudo tee /data/web_static/releases/test/index.html <<EOF
<!DOCTYPE html>
>>>>>>> 15adf91fe08e4c3a8205787853e27968ee0344da
<html>
  <head>
  </head>
  <body>
    Holberton School
  </body>
<<<<<<< HEAD
</html>" | sudo tee /data/web_static/releases/test/index.html

#symbolic link
sudo ln -sf /data/web_static/releases/test/ /data/web_static/current

#changing directory name
sudo chown -R ubuntu:ubuntu /data/

#updating root directory
sudo sed -i '/server_name _;/a \ \tlocation /hbnb_static {\n\t\talias /data/web_static/current;\n\t}\n' /etc/nginx/sites-available/default

#restarting server
=======
</html>
EOF

# creating symbolic link between the files
sudo ln -sf /data/web_static/releases/test/ /data/web_static/current

#changing ownership
sudo chwon -R ubuntu:ubuntu /data/

#server set up
sudo tee -a /etc/nginx/sites-available/default > /dev/null << EOF
	location /hbnb_static {
		alias /data/web_static/current;
	}
EOF

#restarting nginx
>>>>>>> 15adf91fe08e4c3a8205787853e27968ee0344da
sudo service nginx restart
