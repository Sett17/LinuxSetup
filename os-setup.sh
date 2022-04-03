#!/bin/bash

echo -e '\e[32mGetting scripts from github\e[0m'

sudo apt-get -qq -o=Dpkg::Use-Pty=0 -y install curl
curl -s https://raw.githubusercontent.com/Sett17/LinuxSetup/main/.bashrc --output ~/.bashrc
curl -s https://raw.githubusercontent.com/Sett17/LinuxSetup/main/.bash_aliases --output ~/.bash_aliases
curl -s https://raw.githubusercontent.com/Sett17/LinuxSetup/main/.vimrc --output ~/.vimrc
curl -s https://raw.githubusercontent.com/Sett17/LinuxSetup/main/.inputrc --output ~/.inputrc

echo -e '\e[32mInstalled Scripts:\e[0m'
ls -alih ~/.{bashrc,bash_aliases,vimrc,inputrc}

DEBIAN_FRONTEND=noninteractive
# otherPackages=("git", "highlight", "vim", "binwalk", "fd-find", "jq", "wget", "zip", "unzip", "tcpdump")
# echo -e '\e[32mInstalling other packages\e[0m'
# for pkg in ${otherPackages[@]}; do
#   echo "Installing $pkg"
#   sudo apt-get -qq -y install $pkg
# done
echo -e '\e[32mInstalling other packages\e[0m'
sudo apt-get -qq update
sudo apt-get install -qq -y git highlight vim binwalk fd-find jq wget zip unzip tcpdump

echo -e '\e[32mInstalling brew\e[0m'
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" > /dev/null
test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
test -r ~/.bash_profile && echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bash_profile
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.profile

echo -e '\e[32mInstalling other brew packages\e[0m'
otherBrewPackages=("gh", "lazygit")
for pkg in ${otherBrewPackages[@]}; do
  echo "Installing brew $pkg"
  brew install $pkg
done

echo -e '\e[32mInstalling SDKMAN\e[0m'
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

echo -e '\e[32mInstalling Devfile\e[0m'
wget $(curl -s https://api.github.com/repos/sett17/devfile/releases | jq -r 'first.assets[] | select(.name|startswith("dev-linux")) | .browser_download_url') -O ~/.local/bin/dev && chmod +x ~/.local/bin/dev

echo -e '\e[32mAll done!\e[0m'

echo -e '\e[32mTo source config files, run:\e[0m'
echo -e '\e[32m  source ~/.bashrc\e[0m'
echo -e '\e[32m  bind -f ~/.inputrc\e[0m'