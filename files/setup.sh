#!/bin/sh

apt-get -y update > /dev/null 2>&1
apt install -y nginx > /dev/null 2>&1
service nginx start

# html content
cd ~
mkdir www
sudo tee ~/www/index.html << EOM
<html>
  <head><title>Woof!</title></head>
  <body style="background-image: linear-gradient(Purple,blue);">
  <center><img src="https://avatars0.githubusercontent.com/u/8949217?s=460&v=4"></img></center>
  <marquee><h1 style="color:white"> Woof, world!</h1></marquee>
  </body>
</html>
EOM

# nginx.conf file
cd /etc/nginx/sites-available

cat <<EOM > rogman-site.com
server {
        listen 80;
        server_name rogman.centralus.cloudapp.azure.com;
        root /home/adminuser/www;
        index index.html;
}
EOM

ln -s /etc/nginx/sites-available/rogman-site.com /etc/nginx/sites-enabled/
sudo systemctl restart nginx
