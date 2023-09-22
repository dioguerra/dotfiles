# Fresh Installation

## From server only installs

```bash
apt-get install \
	curl htop alsa-utils gnupg software-properties-common
```

## Repositories
```bash
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

# Add Ulauncher PPA
mkdir /etc/apt/keyrings
echo "
deb [signed-by=/etc/apt/keyrings/ulauncher.gpg] https://ppa.launchpadcontent.net/agornostal/ulauncher/ubuntu jammy main
deb-src [signed-by=/etc/apt/keyrings/ulauncher.gpg] https://ppa.launchpadcontent.net/agornostal/ulauncher/ubuntu jammy main
" | sudo tee /etc/apt/sources.list.d/ulauncher.list

curl 'https://keyserver.ubuntu.com/pks/lookup?op=get&search=0xfaf1020699503176' -o /etc/apt/keyrings/ulauncher.key
cat /etc/apt/keyrings/ulauncher.key | apt-key --keyring /etc/apt/keyrings/ulauncher.gpg add -
```

## Apt Packages
```bash
apt-get update
apt-get upgrade
apt-get install \
	xinit i3-wm dunst i3status suckless-tools compton hsetroot fonts-noto fonts-mplus fonts-font-awesome xsettingsd lxappearance \
        scrot imagemagick i3lock
apt-get install \
	git tig meld xclip terminator sshuttle gnome-screenshot \
	spotify-client google-chrome-stable \
	python3 python3-pip \
	openafs-client openafs-krb5
```
```bash
pip install --user keystoneauth1[kerberos] python-magnumclient python-openstackclient
```

## Work Tools
```bash
pip3 install --user virtualenvwrapper
```

## dotfiles
```bash
mkdir ws
cd ws 
git clone git@github.com:dioguerra/dotfiles.git
cd dotfiles
git submodule init
git submodule update
```

```bash
rm $HOME/.bashrc
for f in .gitconfig .gitignore .config/i3 .config/i3status .bash_aliases .bashrc .trueline .config/terminator .vimrc; do ln -s $HOME/ws/dotfiles/$f ~/$f; done
#.bash_profile .config/autorandr .gitmodules .gnupg .irssi .mailcap .mbsyncrc .msmtprc .notmuch-config .vim .viminfo .vimrc .weechat
```

## Visual
```bash
apt install ulauncher --no-install-recommends --no-install-suggests
cd $HOME/ws/dotfiles/nerd-fonts
#./install.sh -l -C -S -T -A
./install.sh -U -l --fontawesome --fontlinux --octicons --pomicons
```

## Scripts
```bash
for s in $(ls $HOME/ws/dotfiles/bin); do ln -s $HOME/ws/dotfiles/bin/$s $HOME/.local/bin/$s; done
```

## SSH
```bash
mkdir ~/.ssh/controlmasters
scp -r lxplus.cern.ch:~/.ssh/id_dsa ~/.ssh
scp -r lxplus.cern.ch:~/.ssh/id_rsa ~/.ssh
```

## GPG
#Public Key: http://keys.gnupg.net/pks/lookup?search=0x5453F6BE&fingerprint=on&op=index
#```bash
#scp -r lxplus.cern.ch:~/.gnupg/* ~/.gnupg
#```
#Helper commands:
#```bash
#gpg --list-keys
#gpg --list-secret-keys
#gpg --encrypt --armor sample.txt
#```

## Container Tools

### docker
```bash
apt install docker.io
usermod -aG docker $USER
```

### kubectl
```bash
mkdir -p $HOME/.local/bin
wget "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" -O $HOME/.local/bin/kubectl
bash -c "$HOME/.local/bin/kubectl completion bash > /etc/bash_completion.d/kubectl"
```

### helm
```bash
wget https://get.helm.sh/helm-v3.5.0-linux-amd64.tar.gz
tar zxvf helm-v3.5.0-linux-amd64.tar.gz
mv linux-amd64/helm $HOME/.local/bin
rm -rf helm-v3.5.0* linux-amd64
```

## Media & Chat

### zoom
```bash
wget https://zoom.us/client/latest/zoom_amd64.deb
sudo apt install ./zoom_amd64.deb
rm zoom*.deb
```
