# General tools
sudo apt-get update
sudo apt-get install -y git wget cmake make curl htop

# Fonts
sudo apt-get install -y fonts-inconsolata
sudo fc-cache -fv

# Docker
# https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/#install-using-the-repository
sudo apt-get install -y apt-transport-https ca-certificates software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce
sudo usermod -a -G docker $USER

# Atom
# http://tipsonubuntu.com/2016/08/05/install-atom-text-editor-ubuntu-16-04/
sudo add-apt-repository ppa:webupd8team/atom
sudo apt-get update
sudo apt-get install atom
