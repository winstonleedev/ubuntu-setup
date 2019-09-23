sudo apt update
sudo apt install -y \
  software-properties-common \
  git \
  net-tools \
  curl \
  wget \
  build-essential \
  net-tools \
  apt-transport-https \
  build-essential \
  chrome-gnome-shell \
  cpu-checker \
  curl \
  firefox-locale-ko \
  fonts-firacode \
  fonts-noto-cjk-extra \
  git \
  gnome-tweaks \
  gnupg-agent \
  ibus-hangul \
  ibus-unikey \
  language-pack-gnome-ko \
  python3-dev \
  python3-pip \
  python3-setuptools \
  whois \
  zsh

sudo snap install \
  android-studio            \
  canonical-livepatch       \
  chromium                  \
  clion                     \
  intellij-idea-ultimate    \
  mailspring                \
  onlyoffice-desktopeditors \
  p3x-onenote               \
  slack                     \
  snap-store                \
  spotify                   \
  termius-app               \
  wallpaperdownloader       \

mkdir ~/Setup
cd ~/Setup

wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb http://download.virtualbox.org/virtualbox/debian bionic contrib"
sudo apt update
sudo apt install virtualbox-6.0

wget https://www.gnome-look.org/p/1136805/startdownload?file_id=1530774600&file_name=ocs-url_3.1.0-0ubuntu1_amd64.deb&file_type=application/x-debian-package&file_size=54502
sudo apt install libqt5svg5 qml-module-qtquick-controls
sudo dpkg -i ocs-url_3.1.0-0ubuntu1_amd64.deb

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s /bin/zsh

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker "$USER"

sudo apt update
sudo apt install python3-dev python3-pip python3-setuptools
sudo pip3 install thefuck
echo "eval $(thefuck --alias)" >> ~/.zshrc

wget https://raw.githubusercontent.com/thanhphu/ubuntu-ansible-playbook/master/saved_settings.dconf
dconf load / < saved_settings.dconf

sudo apt autoclean
sudo apt autoremove