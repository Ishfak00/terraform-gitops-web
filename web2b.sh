yum install wget unzip nginx -y
systemctl start nginx
systemctl enable nginx
wget https://templatemo.com/tm-zip-files-2020/templatemo_518_sentra.zip
unzip -o templatemo_518_sentra.zip 
cp -r templatemo_518_sentra/*  /usr/share/nginx/html
systemctl restart nginx