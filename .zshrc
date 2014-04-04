#!/bin/zsh
##.zshrc##

#history + exports
HISTFILE="${HOME}/.zsh_history"
HISTSIZE='10000'
SAVEHIST="${HISTSIZE}"
export EDITOR="/usr/bin/vim"
export TMP="$HOME/.tmp"
export TEMP="$TMP"
export TMPDIR="$TMP"
export TMPPREFIX="${TMPDIR}/zsh"
export SUDO_EDITOR="/usr/bin/vim -p -X"

autoload -U compinit
compinit
autoload -U promptinit
promptinit

autoload -U colors && colors
#colours 
red='\e[0;31m'
RED='\e[1;31m'
green='\e[0;32m'
GREEN='\e[1;32m'
yellow='\e[0;33m'
YELLOW='\e[1;33m'
blue='\e[0;34m'
BLUE='\e[1;34m'
purple='\e[0;35m'
PURPLE='\e[1;35m'
cyan='\e[0;36m'
CYAN='\e[1;36m'
NC='\e[0m'

#prompt
PROMPT="%n@%m[%{$fg[green]%}%~%{$reset_color%}]%# "

#aliases

alias ..='cd ..'
alias ....='cd ../..'
alias ......='cd ../../..'

alias ls='ls -Fh --color=always'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

alias grep='grep --color=auto'

alias df='df -h'

alias shutdown-bin='sudo shutdown -h -P now'
alias shutdown='sudo systemctl poweroff'
alias restart='sudo systemctl reboot'
alias sleep='sudo systemctl suspend'

alias pacman='sudo pacman'
alias update='pacman -Suy'

alias mountusb='sudo mount -o gid=users,fmask=113,dmask=002 /dev/sdb1 /mnt/usb'
alias umountusb='sudo umount /mnt/usb'

alias v='vim'
alias sv='sudo vim'
alias redwm='cd ~/.dwm; makepkg -g >> PKGBUILD; makepkg -efi --noconfirm; killall dwm'
alias xref='xrandr --output DVI-I-2 --mode 1920x1080 --rate 144.0'
alias lamp-start="sudo systemctl start httpd.service mysqld.service"
alias lamp-stop="sudo systemctl stop httpd.service mysqld.service"
