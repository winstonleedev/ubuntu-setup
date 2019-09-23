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
  ocs-url \
  python3-dev \
  python3-pip \
  python3-setuptools \
  virtualbox-6.0 \
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

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s /bin/zsh

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker "$USER"

wget https://raw.githubusercontent.com/thanhphu/ubuntu-ansible-playbook/master/saved_settings.dconf
dconf load / < saved_settings.dconf

sudo apt autoclean
sudo apt autoremove