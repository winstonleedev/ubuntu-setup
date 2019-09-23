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

sudo snap install --classic android-studio
sudo snap install chromium                 
sudo snap install --classic clion                    
sudo snap install --classic intellij-idea-ultimate   
sudo snap install mailspring               
sudo snap install onlyoffice-desktopeditors
sudo snap install p3x-onenote              
sudo snap install --classic slack                                   
sudo snap install spotify                  
sudo snap install termius-app              
sudo snap install wallpaperdownloader      

mkdir ~/Setup
cd ~/Setup

wget https://gist.githubusercontent.com/thanhphu/b8dfde2cd16902c49dc249f4dfbfb4f8/raw/016e601d67d60810371c3be1b611bcf63451d067/unikey.xml
sudo cp unikey.xml /usr/share/ibus/component/

git clone https://github.com/ZeptByteS/dvorak-qwerty.git
cd dvorak-qwerty
chmod +x install.sh
./install.sh
cd ..

wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb http://download.virtualbox.org/virtualbox/debian bionic contrib"
sudo apt update
sudo apt install -y virtualbox-6.0

curl -fsSL https://www.gnome-look.org/p/1136805/startdownload?file_id=1530774600&file_name=ocs-url_3.1.0-0ubuntu1_amd64.deb&file_type=application/x-debian-package&file_size=54502 -o ocs-url_3.1.0-0ubuntu1_amd64.deb
sudo apt install -y libqt5svg5 qml-module-qtquick-controls
sudo dpkg -i ocs-url_3.1.0-0ubuntu1_amd64.deb

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker "$USER"

sudo apt update
sudo apt install -y python3-dev python3-pip python3-setuptools
sudo pip3 install thefuck
echo "eval $(thefuck --alias)" >> ~/.zshrc

git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
cd ..

mkdir font-hack
cd font-hack
wget https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip
unzip "*.zip" "*.ttf" "*.otf" -d ${HOME}/.fonts
sudo fc-cache -f -v
cd ..

wget https://raw.githubusercontent.com/thanhphu/ubuntu-ansible-playbook/master/saved_settings.dconf
dconf load / < saved_settings.dconf

sudo apt autoclean
sudo apt autoremove

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"