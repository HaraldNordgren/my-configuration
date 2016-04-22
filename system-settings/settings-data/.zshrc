# Path to your oh-my-zsh installation.
#export ZSH=/home/harald/.oh-my-zsh
export ZSH=/home/harald/git-repos/oh-my-zsh

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
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colored-man-pages ubuntu history jsontools python)
#plugins=(git colored-man-pages ubuntu history)

# User configuration

export PATH="/home/harald/opt/miniconda2/bin:/usr/local/heroku/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/opt/openlava-2.2/bin:/opt/openlava-2.2/bin:./"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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
alias ls='ls -B --color=auto'
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
#alias gits='git status'
alias ind="sed 's/^/  /'"

# Single letter aliases for my most used commands
#alias h='history | grep'
alias n='nautilus .'
alias s='sudo'
alias v="vim -p"
alias x='xdg-open'


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# added by Miniconda2 3.19.0 installer
export PATH="/home/harald/opt/miniconda2/bin:$PATH"
