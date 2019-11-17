# Move home to D:
# Install ssh keys and chmod to 700 
# Check out this code

sudo cp -f sources-wsl.list /etc/apt/

sudo apt update
sudo apt upgrade
echo Y | sudo apt install \
  software-properties-common \
  git \
  net-tools \
  curl \
  wget \
  build-essential \
  curl \
  git \
  python3-dev \
  python3-pip \
  python3-setuptools \
  whois \
  zsh \
  unzip

sudo cp wsl.conf /etc/

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker "$USER"

sudo cp docker-credential-secretservice /usr/local/bin
cp config.json ~/.docker/

sudo pip3 install thefuck
echo "eval $(thefuck --alias)" >> ~/.zshrc

sudo apt autoclean
sudo apt -y autoremove

git config --global user.name "Thanh Phu"
git config --global user.email "git@thanhphu.net"

echo y | sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp -f .zshrc ~/
