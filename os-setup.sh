#!/bin/bash

echo -e '\e[31mGetting scripts from github\e[0m'

sudo apt-get -qq -o=Dpkg::Use-Pty=0 -y install curl
curl -s https://raw.githubusercontent.com/Sett17/LinuxSetup/main/.bashrc --output ~/.bashrc
curl -s https://raw.githubusercontent.com/Sett17/LinuxSetup/main/.bash_aliases --output ~/.bash_aliases
curl -s https://raw.githubusercontent.com/Sett17/LinuxSetup/main/.vimrc --output ~/.vimrc
curl -s https://raw.githubusercontent.com/Sett17/LinuxSetup/main/.inputrc --output ~/.inputrc

echo -e '\e[31mInstalled Scripts:\e[0m'
ls -alih ~/.{bashrc,bash_aliases,vimrc,inputrc}

DEBIAN_FRONTEND=noninteractive
otherPackages=("git", "highlight", "vim", "binwalk", "fd-find", "jq", "wget", "tcpdump")
echo -e '\e[31mInstalling other packages\e[0m'
for pkg in ${otherPackages[@]}; do
  echo "Installing $pkg"
  sudo apt-get -qq -o=Dpkg::Use-Pty=0 -y install $pkg
done

echo -e '\e[31mInstalling brew\e[0m'
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
test -r ~/.bash_profile && echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bash_profile
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.profile

echo -e '\e[31mInstalling other brew packages\e[0m'
otherBrewPackages=("gh", "lazygit")
for pkg in ${otherBrewPackages[@]}; do
  echo "Installing brew $pkg"
  brew install $pkg
done

echo -e '\e[31mInstalling SDKMAN\e[0m'
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

echo -e '\e[31mInstalling Devfile\e[0m'
wget $(curl -s https://api.github.com/repos/sett17/devfile/releases | jq -r 'first.assets[] | select(.name|startswith("dev-linux")) | .browser_download_url') -O ~/.local/bin/dev && chmod +x ~/.local/bin/dev

echo -e '\e[31mSourcing the bash files\e[0m'
source ~/.bashrc
bind -f ~/.inputrc

echo -e '\e[31mAll done!\e[0m'