# Run with command:
# curl -s https://raw.githubusercontent.com/dioguerra/dotfiles/main/run.sh | /bin/bash -

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# We need to download dotfiles
sudo apt install -y git
mkdir $HOME/ws
git clone https://github.com/dioguerra/dotfiles.git $HOME/ws/dotfiles && cd $HOME/ws/dotfiles

# Start main install
./INSTALL.sh
