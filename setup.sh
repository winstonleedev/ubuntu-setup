# mount user folder if on external drives using the disks interface, mount to /home

wget https://raw.githubusercontent.com/Yubico/libu2f-host/master/70-u2f.rules
sudo mv 70-u2f.rules /etc/udev/rules.d/

# Install ssh keys and chmod to 700 
# Check out this code
sudo cp -f sources.list /etc/apt/

sudo apt update
sudo apt upgrade
sudo apt --fix-broken install
sudo apt install -y \
  software-properties-common \
  git \
  net-tools \
  curl \
  wget \
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
  dkms \
  filezilla \
  cmake \
  pkg-config

sudo snap install chromium
sudo snap install --classic clion
sudo snap install --classic goland
sudo snap install --classic intellij-idea-ultimate
sudo snap install mailspring
sudo snap install termius-app
sudo snap install --classic code
sudo snap install angstrom
sudo snap install tilix
sudo snap install --classic go

sudo apt install -y flatpak gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install -y flathub com.github.PintaProject.Pinta
flatpak install -y flathub com.slack.Slack
flatpak install -y flathub com.spotify.Client
flatpak install -y flathub nl.hjdskes.gcolor3

mkdir Setup
cd Setup

curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs

sudo add-apt-repository ppa:bamboo-engine/ibus-bamboo -y
sudo apt-get update
sudo apt-get install ibus-bamboo

git clone https://github.com/ZeptByteS/dvorak-qwerty.git
cd dvorak-qwerty
git checkout develop
chmod +x install.sh
sudo ./install.sh
cd ..

sudo cp ../unikey.xml /usr/share/ibus/component/
sudo cp ../bamboo.xml /usr/share/ibus/component/

ibus-daemon &

wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb http://download.virtualbox.org/virtualbox/debian bionic contrib"
sudo apt update
sudo apt install -y virtualbox-6.1
wget https://download.virtualbox.org/virtualbox/6.1.0/Oracle_VM_VirtualBox_Extension_Pack-6.1.0.vbox-extpack
sudo VBoxManage extpack install --replace Oracle_VM_VirtualBox_Extension_Pack-6.1.0.vbox-extpack

sudo apt install -y libqt5svg5 qml-module-qtquick-controls

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker "$USER"

sudo cp docker-credential-secretservice /usr/local/bin
cp config.json ~/.docker/

sudo curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

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

wget https://github.com/getferdi/ferdi/releases/download/v5.4.0/ferdi_5.4.0_amd64.deb
sudo apt install ./ferdi_5.4.0_amd64.deb


sudo apt autoclean
sudo apt -y autoremove

cd ..

sudo apt install ./appimagelauncher_2.0.3-travis888.4f7bc8e.bionic_amd64.deb
sudo apt install ./ocs-url_3.1.0-0ubuntu1_amd64.deb

firefox https://extensions.gnome.org/extension/1080/transparent-notification/
firefox https://extensions.gnome.org/extension/307/dash-to-dock/
firefox https://extensions.gnome.org/extension/1099/transparent-gnome-panel/
firefox https://extensions.gnome.org/extension/1446/transparent-window-moving/
firefox https://extensions.gnome.org/extension/1080/transparent-notification/
firefox https://extensions.gnome.org/extension/1471/tint-all/
firefox https://extensions.gnome.org/extension/19/user-themes/
firefox https://extensions.gnome.org/extension/1287/unite/

mkdir ~/Pictures/Wallpapers
cp Wallpapers/*.* ~/Pictures/Wallpapers/

mkdir capitaine
tar -xf capitaine-cursors-r3.tar.gz
mv cursors capitaine/
mv index.theme capitaine/
sudo mv capitaine /usr/share/icons/

sudo cp Hotspot /etc/NetworkManager/system-connections/

dconf load / < dconf-settings.conf
sudo ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh
cp -f .zshrc ~/
cp -f settings.json ~/.config/Code/User/
cp -f keybindings.json ~/.config/Code/User/

git config --global user.name "Thanh Phu"
git config --global user.email "git@thanhphu.net"

echo y | sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s $(which zsh)

sudo apt install ubuntu-restricted-extras
sudo ufw enable

cd ~/.ssh
ssh-add home
ssh-add id_rsa

