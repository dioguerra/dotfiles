# Run with command:
# curl -s https://raw.githubusercontent.com/dioguerra/dotfiles/main/run.sh | /bin/bash -

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

./INSTALL.sh
