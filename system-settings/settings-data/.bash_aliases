alias s='sudo'
alias x='xdg-open'
alias n='nautilus .'

# Resets the terminal without the time delay
alias c="echo -ne '\0033\0143'"

# Sort by file extension with directories first
alias lt='ls -X --group-directories-first'

# Open several files in tabs in Vim
alias v="vim -p"

# Grep recursive and ignore binary files
alias igrep='grep --color=auto -rI'

alias gits='git status'
alias ind="sed 's/^/  /'"

alias virtualbox='sudo modprobe vboxdrv; virtualbox'
alias windows='sudo modprobe vboxdrv; VBoxManage startvm "Windows 8.1"'

# Disable side-scroll while Matlab is running
alias matlab='synclient HorizTwoFingerScroll=0; matlab; synclient HorizTwoFingerScroll=1'

# Search history
alias h='history | grep'
