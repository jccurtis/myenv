# General tools
sudo apt update
sudo apt install -y \
    git \
    wget \
    cmake \
    make \
    curl \
    htop \
    vim \
    software-properties-common \
    apt-transport-https \
    ca-certificates

# Docker
# https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/#install-using-the-repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install -y docker-ce
sudo usermod -a -G docker $USER

# Atom
# https://flight-manual.atom.io/getting-started/sections/installing-atom/#platform-linux
# curl -sL https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
# sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'
# sudo apt-get update
# sudo apt-get install atom

# VS Code
# https://linuxize.com/post/how-to-install-visual-studio-code-on-ubuntu-18-04/
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code
