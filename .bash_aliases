alias la='ls -A'
alias l='ls -lhaF'
alias lh='ls -lha -F'
alias lt='ls -alihtr'
alias cls='clear'
alias goto='cd '
alias root='/mnt/c/Users/sett'
alias wsl='pwd | cmd.exe /c start wsl.exe'
alias cmd='cmd.exe'
alias start='cmd.exe /c '
alias gccWin='/mnt/c/ProgramData/chocolatey/bin/gcc.exe'
alias explorer='cmd.exe /c explorer .'
alias minikube='/mnt/c/Program\ Files/Kubernetes/Minikube/minikube.exe'
alias clip='head -c -1 | /mnt/c/Windows/System32/clip.exe'
alias paste='/mnt/c/windows/System32/paste.exe'
alias dog='highlight -O ansi --force -t 2 '
alias d='dog '
alias g='grep '
alias lg='lazygit '
alias chrome='cmd.exe /c chrome'
alias nmap='"/mnt/c/program files (x86)/nmap/nmap.exe"'
alias hashcat='"/mnt/c/users/sett/documents/bins/hashcat-6.2.4/hashcat.exe"'
alias vscode='"/mnt/c/Users/sett/AppData/Local/Programs/Microsoft VS Code/Code.exe" '
alias atzen='ssh sett@atzen.berlin -t tmux -u new-session -a -s sett'
alias atzenshared='ssh shared@atzen.berlin -t tmux -u new-session -a -s shared'
alias v='vim '
alias fd='fdfind '
alias sudo='sudo '

comasm () { nasm -f bin "$@.asm" -o "$@.com" -l "$@.lst" && emu2 "$@.com"; }
elfAsm () { nasm -f elf64 "$@.asm" && ld -s -o "$@" "$@.o" && "./$@"; }
mkcd () { mkdir -vp "$@" && cd "$@"; }
fastpush () { DATE=`date +"%D %T"`; git add . --all 2> /dev/null && git commit --allow-empty -m "$DATE" && git push; }
msgpush () { DATE=`date +"%D %T"`; echo "commit message: ";read -e INP; git add . --all 2> /dev/null; git commit --allow-empty -m "$INP @$DATE" && git push; }
searchhighlighter () { highlight --list-scripts=LLLLLLL | grep "$@"; }

#PS1='\[\e[35m\]┌(\[\e[94m\]\[\e[1m\]\u\[\e[0m\]\[\e[35m\])─[\[\e[97m\]\t\[\e[35m\]]─{\[\e[1m\]\[\e[97m\]\w\[\e[0m\]\[\e[35m\]}\n\[\e[35m\]└🍺─\[\e[0m\]'

PS1R="\[\e[0m\]"
PS1DIRCOLOR="\[\e[38;5;117m\]"
PS1GITCOLOR="\[\e[38;5;199m\]"
setPS1 () {
  RESULT=$?

  CWD=$(pwd)
  if [ $(id -u) -eq 0 ];then
    PS1USER="\[\e[38;5;208m\u\] | \[\e[0m\]"
  else
    PS1USER=""
  fi
  if [[ $(pwd) == *mnt/c* ]]; then
    PS1DIR=${CWD:5:99}
  else
    PS1DIR="\w"
  fi
  if [ $RESULT -ne 0 ];then
    PS1SYMBOL="🔴"
  else
    PS1SYMBOL="🟢"
  fi
  PS1GITBRANCH=$(git branch 2>/dev/null | grep '^*' | colrm 1 2)
  if [ -z $PS1GITBRANCH ];then
    PS1GIT=""
  else
    PS1GIT=" 🦑 $PS1GITBRANCH"
  fi
  cd .
  PS1="\n$PS1SYMBOL $PS1USER$PS1DIRCOLOR$PS1DIR$PS1GIT$PS1R\n"
}
PROMPT_COMMAND=setPS1

upload(){ if [ $# -eq 0 ];then echo "No arguments specified.\nUsage:\n transfer <file|directory>\n ... | transfer <file_name>">&2;return 1;fi;if tty -s;then file="$1";file_name=$(basename "$file");if [ ! -e "$file" ];then echo "$file: No such file or directory">&2;return 1;fi;if [ -d "$file" ];then file_name="$file_name.zip" ,;(cd "$file"&&zip -r -q - .)|curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null,;else cat "$file"|curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null;fi;else file_name=$1;curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null;fi;}
