#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

#User-defined
alias pacman='sudo pacman'
alias shutdown='sudo shutdown -h -P now'
alias redwm='cd ~/.dwm; makepkg -g >> PKGBUILD; makepkg -efi --noconfirm; killall dwm'
#alias sql-start='sudo systemctl start mysqld.service'
#alias sql-stop='sudo systemctl stop mysqld.service'
alias lamp-start="sudo systemctl start httpd.service mysqld.service"
alias lamp-stop="sudo systemctl stop httpd.service mysqld.service"


PS1='[\u@\h \W]\$ '
complete -cf sudo
