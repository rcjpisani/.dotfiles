#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

#User-defined
#alias cdl='cd $1 && ls -la'
alias pacman='sudo pacman';
alias shutdown='sudo shutdown -h -P now'
alias redwm='cd ~/dwm; makepkg -g >> PKGBUILD; makepkg -efi --noconfirm; killall dwm'

PS1='[\u@\h \W]\$ '
complete -cf sudo
