# Install Apache, MySql and PHP
sudo apt update
sudo apt install -y apache2
sudo apt install -y mysql-server
sudo apt install -y php libapache2-mod-php php-mysql
sudo systemctl restart apache2
