# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


## vcs_info ##

setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
        '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       \
        '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

zstyle ':vcs_info:*' enable git

vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}
RPROMPT=$'$(vcs_info_wrapper)'

## end of vcs_info ##

setopt autocd

#http://superuser.com/q/633926/
#http://stackoverflow.com/q/10036255/
case $TERM in
    xterm*)
        precmd () {
            [[ "$PWD" =~ ^"$HOME"(/|$) ]] && title="~${PWD#$HOME}" || title=$PWD
            print -Pn "\e]0;$(whoami): $title\a"}
        ;;
esac


function mkcd
{
    mkdir -p "$1" && cd "$1"
}

function unzipd
{
    unzip $1 -d ${1%.zip}
}


# Default Bash aliases
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -alF'

# Resets the terminal without the time delay
alias c="echo -ne '\0033\0143'"

# Sort by file extension with directories first
alias lt='ls -X --group-directories-first'

# Grep recursive and ignore binary files
alias igrep='grep --color=auto -rI'

# Virtualbox
alias virtualbox='sudo modprobe vboxdrv; virtualbox'
alias windows='sudo modprobe vboxdrv; VBoxManage startvm "Windows 8.1"'

# Disable side-scroll while Matlab is running
alias matlab='synclient HorizTwoFingerScroll=0; matlab; synclient HorizTwoFingerScroll=1'

# Misc
alias gits='git status'
alias ind="sed 's/^/  /'"

# Single letter aliases for my most used commands
alias h='history 1 | grep'
alias n='nautilus .'
alias s='sudo'
alias v="vim -p"
alias x='xdg-open'


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# added by Miniconda2 3.19.0 installer
export PATH="/home/harald/opt/miniconda2/bin:$PATH"

#TODO
#Return code of last command
#Git: Show uncommited