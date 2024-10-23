------ Hệ điều hành Ubuntu -------------------------

1/ Khi tạo một máy mới thì ổ cứng là 128 GB (tùy theo máy nữa)
	=> phân vùng SWAP: 8 GB RAM ảo (Bộ nhớ tạm ảo)
	=> phân vùng /root: 40 GB (thường là dấu "/")
	=> phân vùng /home: còn lại

----------------------------------------------------

---------------Cài đặt VMWare Tools-----------------

sudo apt install open-vm-tools-desktop -y  >> NHớ NHẤN ENTER NHA!

----------------------------------------------------

--------------Cài một ứng dụng phổ biến-------------

Step 1: sudo apt update
        sudo apt upgrade

Step 2: sudo apt install libreoffice -y 

        sudo apt install inkscape -y

        sudo add-apt-repository ppa:bamboo-engine/ibus-bamboo

Step 3: sudo apt update

        sudo apt install ibus-bamboo

Step 4: Vào Setting >> Keyboard >> tìm tiếng Việt

Step 5: Reboot  >> Khởi động lại máy ảo.

----------------------------------------------------

------------Tạo thư mục mới-------------------------

for i in {1..20}; do
    mkdir project$i
    cd project$i
    mkdir src docs
    cd ..
done

Step 1: Lưu vào thư mục Document với cái tên create_folder.sh

Step 2: Mở lại Terminal

        cd Documents/

Step 3: bash create_folder.sh

----------------------------------------------------

-----------Cài Docker-------------------------------

Step 1: sudo apt-get update

Step 2: sudo apt-get install ca-certificates curl gnupg

Step 3: sudo install -m 0755 -d /etc/apt/keyrings

Step 4: curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

Step 5: sudo chmod a+r /etc/apt/keyrings/docker.gpg

Step 6: echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/nul

Step 7: sudo apt-get update

Step 8: sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

Step 9: sudo docker run hello-world

Step 10: Mở trình duyệt lên và tải với link https://docs.docker.com/desktop/install/linux/ubuntu/#install-docker-desktop >> Tải link DEB package

Step 11: sudo apt-get install ./docker-desktop-amd64.deb

Step 12: sudo systemctl start docker

Step 13: systemctl --user start docker-desktop

----------------------------------------------------

-----------Cài đặt Visual Studio Code---------------

Step 1: sudo snap update

Step 2: sudo snap install code --classic

Step 3: code

----------------------------------------------------

--------------Cài đặt các Extensions----------------

Material Icon Theme

Live Server -- Nhớ tạo thư mục mới để hoạt động

Prettier - Code Formatter

Better Comments 

Auto Rename Tag

Auto Close Tag

Mithril Emmet

----------------------------------------------------

--------Cấu hình kết nối VS Code với GITHUB---------


Step 1: sudo apt update && sudo apt upgrade

Step 2: sudo apt install git

Step 3: git config --global user.name "CODERTHIEN" && git config --global user.email "caominhthien180405@gmail.com"

Step 4: git init  >>> git status >>> git add "Ma nguon mo mien phi.bash" -- "Tên file"



--------------------Kết nối bảo mật---------------------------------
        ssh-keygen -t ed25519 -C "caominhthien180405@gmail.com"

        cat ~/.ssh/id_ed25519.pub >>> 

        eval "$(ssh-agent -s)"
        ssh-add ~/.ssh/id_ed25519

        ---Khởi động SSH------

        eval $(ssh-agent -s)

        ssh-add ~/.ssh/id_ed25519  >>> Hãy nhập 123abc
--------------------------------------------------------------------

Step 5: GitHub Pull Requests Cài thêm

Step 6: git clone https://github.com/CODERTHIEN/minhthien.git  >>> git remote add origin https://github.com/username/repo.git


Step 7: git add . // tất cả 
        git commit -m "Nội dung commit"

----------------------------------------------------

-----------------Cài đặt Wordpress------------------

Step 1: sudo apt update

Step 2: sudo apt install apache2 \
                        ghostscript \
                        libapache2-mod-php \
                        mysql-server \
                        php \
                        php-bcmath \
                        php-curl \
                        php-imagick \
                        php-intl \
                        php-json \
                        php-mbstring \
                        php-mysql \
                        php-xml \
                        php-zip

Step 3: sudo mkdir -p /srv/www

Step 4: sudo chown www-data: /srv/www

step 5: curl https://wordpress.org/latest.tar.gz | sudo -u www-data tar zx -C /srv/www  

        * Nếu không cài được thì hãy cài sudo snap install curl >> Rồi sau đó cài lại là dược

Step 6: sudo nano /etc/apache2/sites-available/wordpress.conf

Step 7: Dán vào đoạn code này:
<VirtualHost *:80>
 DocumentRoot /srv/www/wordpress
 <Directory /srv/www/wordpress>
 Options FollowSymLinks
 AllowOverride Limit Options FileInfo
 DirectoryIndex index.php
 Require all granted
 </Directory>
 <Directory /srv/www/wordpress/wp-content>
 Options FollowSymLinks
 Require all granted
 </Directory>
</VirtualHost>

Step 8: sudo a2ensite wordpress

Step 9: sudo a2enmod rewrite

Step 10: sudo a2dissite 000-default

Step 11: sudo service apache2 reload

Step 12: sudo mysql -u root

Step 13: CREATE DATABASE ps42344;

        CREATE USER minhthien@localhost IDENTIFIED BY 'sa@123';

        GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER >> Nhấn Enter.
        ON ps42344.* (tên database) >> Nhấn Enter.
        TO minhthien@localhost; (tên username) >> Nhấn Enter

        FLUSH PRIVILEGES;

        quit / để thoát ra

Stpe 14: sudo service mysql start

Step 15: sudo -u www-data cp /srv/www/wordpress/wp-config-sample.php /srv/www/wordpress/wp-config.php

Step 16: sudo -u www-data sed -i 's/database_name_here/ps42344/' /srv/www/wordpress/wp-config.php
        sudo -u www-data sed -i 's/username_here/minhthien/' /srv/www/wordpress/wp-config.php
        sudo -u www-data sed -i 's/password_here/sa@123/' /srv/www/wordpress/wp-config.php

Step 17: sudo -u www-data nano /srv/www/wordpress/wp-config.php 

Step 18: https://api.wordpress.org/secret-key/1.1/salt/

        Nhấn Ctrl + K : Để xóa dòng

Step 19: http://localhost/

----------------------------------------------------

-------------Cài Odoo-------------------------------

sudo apt update

sudo apt install postgresql -y

wget -q -O - https://nightly.odoo.com/odoo.key | sudo gpg --dearmor -o /usr/share/keyrings/odoo-archive-keyring.gpg

echo 'deb [signed-by=/usr/share/keyrings/odoo-archive-keyring.gpg] https://nightly.odoo.com/17.0/nightly/deb/ ./' | sudo tee /etc/apt/sources.list.d/odoo.list

sudo apt-get update && sudo apt-get install odoo

http://localhost:8069/

----------------------------------------------------