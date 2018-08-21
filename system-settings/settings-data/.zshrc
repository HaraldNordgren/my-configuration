# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME=random
ZSH_THEME=peepcode
#ZSH_THEME=itchy
#ZSH_THEME=nicoulaj
#ZSH_THEME=agnosterzak

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
#COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.


export ZSH=~/git-repos/oh-my-zsh

if [ $(uname -s) = Linux ]; then

    export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/harald/bin:~/git-repos/my-configuration/git-scripts

    plugins=(git colored-man-pages ubuntu history python)
    alias ls='ls -B --color=auto'
    alias lt='ls -X --group-directories-first'
    alias c="echo -ne '\0033\0143'"
    function o { if [ -n "$1" ]; then xdg-open $1&; else nautilus .&; fi }

elif [ $(uname -s) = Darwin ]; then

    plugins=(git colored-man-pages history jsontools python)
    alias ls='ls -G'
    alias o='open .'

fi

source $ZSH/oh-my-zsh.sh

function mkcd { mkdir -p "$1" && cd "$1" }
function unzipd { unzip $1 -d ${1%.zip} }

alias grep='grep --color=auto'
alias igrep='grep -rI'
alias ind="sed 's/^/  /'"
alias hst='history | grep'
alias ll='ls -alF'
alias pp='python -m json.tool' 
alias s='sudo'
alias v="vim -p"
alias l='less'
alias gs=

unsetopt correct_all
unsetopt share_history

export PATH="$HOME/.cargo/bin:$PATH"

export GOPATH="/Users/harald/go"
export PATH="$GOPATH/bin:$PATH"

DISABLE_UPDATE_PROMPT=true

MY_CONFIG=$HOME/git-repos/my-configuration

