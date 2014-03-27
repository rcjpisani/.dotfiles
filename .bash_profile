#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

export JAVA_HOME=/usr/lib/jvm/java-7-openjdk/bin/java
