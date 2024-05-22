#!/bin/bash

# Update package list
sudo apt update

# Install tools via snap
sudo snap install google-cloud-cli --classic
sudo snap install terraform --classic
sudo snap install kubectl --classic
sudo snap install glab
sudo snap install helm --classic
sudo snap install k9s
sudo snap install dive
sudo snap install code --classic
#sudo snap install openlens --classic
sudo snap install flameshot

# Add the git PPA to install the latest stable upstream Git version
sudo add-apt-repository ppa:git-core/ppa

# Install tools via apt
sudo apt install -y tmux byobu git ansible openvpn git python3-pip

# Install Docker
sudo apt install -y ca-certificates
sudo mkdir -p /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin

# Install kube-capacity
KUBE_CAPACITY_VERSION=$(curl -s https://api.github.com/repos/robscott/kube-capacity/releases/latest | grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/')
curl -Lo kube-capacity.tar.gz https://github.com/robscott/kube-capacity/releases/download/v$KUBE_CAPACITY_VERSION/kube-capacity_v${KUBE_CAPACITY_VERSION}_linux_x86_64.tar.gz
tar -xzf kube-capacity.tar.gz || (echo "Failed to extract kube-capacity.tar.gz"; exit 1)
sudo mv kube-capacity /usr/local/bin/
rm kube-capacity.tar.gz

# Install switcher
KUBESWITCH_VERSION=$(curl -s https://api.github.com/repos/danielfoehrKn/kubeswitch/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
sudo curl -L -o /usr/local/bin/switcher https://github.com/danielfoehrKn/kubeswitch/releases/download/${KUBESWITCH_VERSION}/switcher_linux_amd64
sudo chmod +x /usr/local/bin/switcher
