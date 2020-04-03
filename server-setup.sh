sudo apt-get update
sudo apt-get upgrade
sudo apt-get install zsh ufw curl wget git software-properties-common
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#secure the srver
mkdir ~/.ssh
touch  ~/.ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC7YrCS0Kd5+LqgUvXGKxL7dr+L/75Y7fdESl3s8jTpHvTVPiG4nX0KuemwFglvD5gzV+oUOK5ASVQrIf2oje49/MlG53X9xh7mpAowiKnhYVRmu77WL5hy1Z5B5eB5IA31j9ufCDaOQm+tr9vm4kcimBQCe4WPPFRs/xmvCq1U+gV2DoLEcHiS3gYTumG1xR0uFqfjE6l2hF2biLjVhLiz1MQeUOzbSJ28qha+ZqamAVoP8mLDM7VvD3W3yw2b9UXoaS4GujQt+zzETWUqCQGCwTa0gOce0gI5aa4ph+r+plNIBEtblrLmKSwUC6hLaC8R2yEJYvRrqBwfMMrqv5b+pclfpoNuSU83x8MRDBnwoTrRaHOnIq1T+GVr6/9KSfLBjhQaJxjIkFE7r8c3qb4XjtdTlmohRbZv7CIJKMAWNNaoi5mAkoEvBW3D0d43LQeL8/BBd8KiPvtb8VPneOCvc3CEuk3GL3frLGNG72BJZNsCw368E0rLTkVPghWDjXDn9MW4OcSYweXGgSKTYsGb+TLNe/WEZeTfQXMc9/UyxKN4CT0Oe6WRxSGVRXgl9p2UA26mLmMvNUSS0yDHJ3KceEkiwaZLcIA486mVlW6Fin2ML5ll+tZXclzI1qmFxiiuBg+xwf0n/imqWtg+FC6cZhRT5D6QI26t/oMsCBOzXQ== work" >> ~/.ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC91A26IHct9T7rIKGwE6+d/qfbXoI2kl6VL0HffOPHe9grYwNQpE4d7VSAf1DYP2IjAo5DoYRQyruZDfFw/MkP/h7qteYcgNYctNNUnv3ZXSe2GryFXDeOuqLmwkC3BrQ/N/1kKoBQrOqNcLGEmQZfEqMhDNulwfHKLBmcc26ehdp+ABjgFs98q1JoPlkO4h2fnLQL5/q7vGI9BZIsFkLyKCFxatet/ZlLD8Tf5WhhcgkJlB/Eq88JkIbATcdybfr6pC2UQvivI4jREcmAd9Hx9yGE0AYdvszaHusZnlK1JnEvDwBiEEd+em9XLcXfencV/OrX4Sy+ewBPOHzy+nrqNVi4+oE1lP4FOK6pdJLe6W0xl+nKAdmYLjmR6SIrKJEVeXI7qvNdxgB/UASCBqOkuqpOGyFpAS3RjtVlHy6Ye11GyY/Ud/rmW4b5/MF9vhGO6iLPXoDs9UxVFw4JPPUL1ejIh10EhDOY/DZGybsKDP/ttBtqLhkRCX560ppdGJCRM0EiH6U/87HtZTKs6Kj+tRcoIviTsL3l+KDR1ma/sDN8NTV3gU2VZfOFO92GDO4FP1wdCQ18BcHWLHzASLw1173XfD2z2e70TSor48+PL8mcjI3+usJVY6ESM2Uvf9W2H8AVuzyJ7QnNEPis0YFkBX5Gvf6/iBafFwvVvDP0Qw== home" >> ~/.ssh/authorized_keys

sudo sed -re 's/^(\#?)(PasswordAuthentication)([[:space:]]+)yes/\2\3no/' -i."$(echo 'old')" /etc/ssh/sshd_config
sudo ufw allow OpenSSH
yes y | sudo ufw enable

#Update locale
sudo locale-gen en_US
sudo locale-gen en_US.UTF-8
sudo update-locale LANG=en_US.UTF-8

#Install virtualmin
wget http://software.virtualmin.com/gpl/scripts/install.sh
chmod +x install.sh
sudo ./install.sh

#Install php 7.3
add-apt-repository ppa:ondrej/php && apt-get update
sudo apt-get install php7.3 php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-mysql php7.3-mbstring php7.3-zip php7.3-fpm php7.3-bcmath php7.3-intl php7.3-simplexml php7.3-dom php7.3-curl php7.3-gd libapache2-mod-php7.3

a2enmod proxy_fcgi setenvif
a2enconf php7.3-fpm
service apache2 reload

#Install php7.3-mcrypt
sudo apt-get -y install gcc make autoconf libc-dev pkg-config libmcrypt-dev
sudo pecl install --nodeps mcrypt-snapshot
sudo bash -c "echo extension=mcrypt.so > /etc/php/7.3/fpm/conf.d/mcrypt.ini"
sudo service php7.3-fpm restart

#Install latest composer
cd ~
curl -sS https://getcomposer.org/installer -o composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer

#Install nvm (make things slow)
# cd ~
# curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
# nvm install node 
# npm i -g pnpm
# pnpm i -g forever pm2

#Install npm
sudo apt-get install nodejs
npm i -g pnpm