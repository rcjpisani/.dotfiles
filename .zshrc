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
export TERM=xterm-256color

#completion

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

#functions
termtitle() {
	case "$TERM" in
		rxvt*|xterm|nxterm|gnome|screen|screen-*)
			local prompt_host="${(%):-%m}"
			local prompt_user="${(%):-%n}"
			local prompt_char="${(%):-%~}"
			case "$1" in
				precmd)
					printf '\e]0;%s@%s: %s\a' "${prompt_user}" "${prompt_host}" "${prompt_char}"
					;;
				preexec)
					printf '\e]0;%s [%s@%s: %s]\a' "$2" "${prompt_user}" "${prompt_host}" "${prompt_char}"
					;;
			esac
			;;
	esac
}

preexec() {
	# Set terminal title along with current executed command pass as second argument
	termtitle preexec "${(V)1}"
}

#autoload
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
PS2="% "
PS3=PS2

#aliases

cdl() { cd "$@" && ls; }
alias ..='cd ..'
alias ....='cd ../..'
alias ......='cd ../../..'

alias ls='ls -Fh --color=always'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

alias grep='grep --color=auto'

alias df='df -h'

alias pls='sudo $(fc -ln -1)'

alias shutdown-bin='sudo shutdown -h -P now'
alias shutdown='sudo systemctl poweroff'
alias restart='sudo systemctl reboot'
alias sleep='sudo systemctl suspend'

alias sce='sudo systemctl enable'
alias scd='sudo systemctl disable'
alias scr='sudo systemctl restart'

alias pacman='sudo pacman'
alias update='pacman -Syu'

alias mountusb='sudo mount -o gid=users,fmask=113,dmask=002 /dev/sdb1 /mnt/usb'
alias umountusb='sudo umount /mnt/usb'

alias term='urxvt +sb -bg #303030 -fg #C7C7C7 -cr #FFFFFF'
alias v='vim'
alias sv='sudo vim'
alias note='vim `date "+%y-%m-%d"`'

alias redwm='cd ~/.dwm; makepkg -g >> PKGBUILD; makepkg -efi --noconfirm; killall dwm'

alias serv='ssh robert@servwhar'
alias acnmp='ssh rpadmin@vps.erinic.com'

alias lamp-start='sudo systemctl start nginx.service mysqld.service php-fpm.service'
alias lamp-restart='sudo systemctl restart nginx.service mysqld.service php-fpm.service'
alias lamp-stop='sudo systemctl stop nginx.service mysqld.service php-fpm.service'
alias mysqlroot='mysql -u root -p'
