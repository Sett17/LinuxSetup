#!/bin/bash

echo -e '\e[31mGetting scripts from github\e[0m'

# SVN to download single directory from GitHub
sudo apt-get -qq -o=Dpkg::Use-Pty=0 -y install subversion

svn export https://github.com/Sett17/justSomeFiles/trunk/wsl
mv wsl/* ~
rm -r wsl

echo -e '\e[31mInstalled Scripts:\e[0m'
ls -alih ~/.{bashrc,bash_aliases,vimrc,inputrc}

otherPackages=("git", "highlight", "vim", "binwalk", "fd-find", "jq", "wget", "curl", "tcpdump")

echo -e '\e[31mInstalling other packages\e[0m'
for pkg in ${otherPackages[@]}; do
  echo "Installing $pkg"
  sudo apt-get -qq -o=Dpkg::Use-Pty=0 -y install $pkg
done