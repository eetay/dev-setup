export DOCKER_HOST=tcp://192.168.99.100:2376
export DOCKER_MACHINE_NAME=default
export DOCKER_TLS_VERIFY=1
export DOCKER_CERT_PATH=/Users/eetay/.docker/machine/machines/default
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export GREP_COLOR='91'
alias grep="grep --color"
alias ls='ls -GFh'
#export PS1="\u@\h:\w>"
export PATH="$PATH:$HOME/.rvm/bin:$HOME/Library/Python/3.6/bin" # Add RVM to PATH for scripting
#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:/usr/local/mysql/lib"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
