sudo apt update
sudo apt upgrade
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
  zsh \
  dkms

firefox https://extensions.gnome.org/extension/1080/transparent-notification/
firefox https://www.gnome-look.org/p/1136805/
firefox https://extensions.gnome.org/extension/307/dash-to-dock/
firefox https://extensions.gnome.org/extension/1099/transparent-gnome-panel/
firefox https://extensions.gnome.org/extension/1446/transparent-window-moving/
firefox https://extensions.gnome.org/extension/1080/transparent-notification/

sudo snap install chromium
sudo snap install --classic clion
sudo snap install --classic intellij-idea-ultimate
sudo snap install mailspring
sudo snap install termius-app
sudo snap install --classic code
sudo snap install angstrom
sudo snap install tilix

sudo apt install -y flatpak gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install -y flathub com.github.PintaProject.Pinta
flatpak install -y flathub com.slack.Slack
flatpak install -y flathub com.spotify.Client
flatpak install -y flathub nl.hjdskes.gcolor3

mkdir Setup
cd Setup

sudo add-apt-repository ppa:bamboo-engine/ibus-bamboo -y
sudo apt-get update
sudo apt-get install ibus-bamboo

sudo cp ../unikey.xml /usr/share/ibus/component/
sudo cp ../bamboo.xml /usr/share/ibus/component/

git clone https://github.com/ZeptByteS/dvorak-qwerty.git
cd dvorak-qwerty
git checkout develop
chmod +x install.sh
sudo ./install.sh
cd ..

ibus-daemon &

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
unzip "*.zip" "*.ttf" -d ${HOME}/.fonts
sudo fc-cache -f -v
cd ..

firefox https://github.com/TheAssassin/AppImageLauncher/releases

sudo apt autoclean
sudo apt -y autoremove

cd ..

dconf load / < dconf-settings.conf
ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh
cp -f .zshrc ~/
cp -f settings.json ~/.config/Code/User/
cp -f keybindings.json ~/.config/Code/User/

git config --global user.name "Thanh Phu"
git config --global user.email "git@thanhphu.net"

echo y | sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
