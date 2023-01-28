#!/bin/zsh
##.zshrc##

# Path
PATH=$PATH:~/.bin:~/.local/bin

# Options
bindkey -v # Vim bindings pls
setopt PROMPT_SUBST

# History
HISTFILE="${HOME}/.zsh_history"
HISTSIZE='10000'
SAVEHIST="${HISTSIZE}"

# Exports
export SUDO_EDITOR="/usr/bin/vim -p -X"
export EDITOR="/usr/bin/vim"
export VISUAL="/usr/bin/vim"
export TMP="$HOME/.tmp"
export TEMP="$TMP"
export TMPDIR="$TMP"
export TMPPREFIX="${TMPDIR}/zsh"
export TERM=xterm-256color
export GPG_TTY=$(tty)
export XDG_CONFIG_HOME="$HOME/.config"

# Completion
zstyle ':completion:*' menu select
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':vcs_info:*' enable git

# Functions
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

precmd() {
	vcs_info
}

preexec() {
	# Set terminal title along with current executed command pass as second argument
	termtitle preexec "${(V)1}"
}

git_status() {
	git_status=$(git status 2> /dev/null)
	status_icon="%{$fg[red]%}";
	status_icon+=$(echo $git_status | awk '$1 == "Changes" { print "x"; exit; }')
	status_icon+="%{$fg[yellow]%}";
	status_icon+=$(echo $git_status | awk '$1 == "Untracked" { print "!"; exit; }')
	status_icon+="%{$fg[green]%}";
	status_icon+=$(echo $git_status | awk '$1 == "nothing" { print "o"; exit; }')
	status_icon+="%{$reset_color%}";

	echo $status_icon
}

git_prompt_info() {
	branch_prompt=$(git branch 2> /dev/null | awk '$1 == "*" { print $2 }')
	if [ -n "$branch_prompt" ]; then
		status_icon=$(git_status)
		echo "[%{$terminfo[bold]$fg[cyan]%}$branch_prompt%{$reset_color%}:%{$terminfo[bold]$status_icon%}]"
	fi
}

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        source "$BASE16_SHELL/profile_helper.sh"

base16_tomorrow-night

# Autoload
autoload -Uz compinit && compinit
autoload -Uz promptinit && promptinit
autoload -U colors && colors
autoload -Uz vcs_info

# Git info
local git_info='$(git_prompt_info)'

# Prompt
PROMPT="
%{$fg[cyan]%}%n\
%{$fg[white]%}@\
%{$fg[green]%}%m\
%{$fg[white]%}[\
%{$terminfo[bold]$fg[yellow]%}%.%{$reset_color%}\
%{$fg[white]%}]\
${git_info}\
%{$fg[white]%}[%D %*]%(?..[%{$terminfo[bold]$fg[red]%}%?%{$reset_color%}] )
%{$terminfo[bold]$fg[red]%}$ %{$reset_color%}"

# Start only ONE SSH Agent process at a time
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
	ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [ ! -f "$SSH_AUTH_SOCK" ]; then
	source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

# Keychain
#eval $(keychain --eval --quiet id_rsa ~/.ssh/id_rsa)

# Aliases
alias rm='rm -i'

alias ..='cd ..'
alias ....='cd ../..'
alias ......='cd ../../..'

alias ls='ls -Fh --color=always'
#alias ls='ls -FhG' # for Mac
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias tree='tree -C'

alias grep='grep --color=always'

alias df='df -h'

alias pls='sudo $(fc -ln -1)'

alias shutdown='sudo systemctl poweroff'
alias restart='sudo systemctl reboot'
alias sleep='sudo systemctl suspend'

alias v='vim'
alias sv='sudoedit'
alias note='vim `date "+%Y-%m-%d"`'
