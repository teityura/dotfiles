#===============================================================================
# Export term
#===============================================================================
export TERM=xterm


#===============================================================================
# Add alias
#===============================================================================
alias .='pwd'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias grep='grep --color=always'

case "${OSTYPE}" in
darwin*)
    alias l="ls -alG"
    alias ll="ls -alG"
    alias lll="ls -alG"
    alias ls="ls -G"
  ;;
linux*)
    alias l='ls -al --color=always'
    alias ll='ls -al --color=always'
    alias lll='ls -al --color=always'
    alias ls="ls --color=always"
  ;;
esac


#===============================================================================
# Add docker alias
#===============================================================================
alias dps='docker ps -a'
alias dv='docker volume ls'
alias di='docker images'

alias dpr=_dockerRemoveAllForce
function _dockerRemoveAllForce() {
    if [ "$1" = "all" ]; then
        docker container ps -aq | xargs docker rm -f
        docker volume ls -q | xargs docker volume rm -f
        docker images -aq | xargs docker image rm -f
        docker container ps -a
        docker volume ls
        docker image ls
    elif [ "$1" = "con" ]; then
        docker container ps -aq | xargs docker rm -f
        docker container ps -a
    elif [ "$1" = "vol" ]; then
        docker volume ls -q | xargs docker volume rm -f
        docker volume ls
    elif [ "$1" = "img" ]; then
        docker images -aq | xargs docker image rm -f
        docker image ls
    else
        echo 'need target: [con, vol, img, all]'
    fi
}


#===============================================================================
# Add path
#===============================================================================
if [ ! -d "${HOME}/bin" ]; then
    mkdir "${HOME}/bin"
fi
PATH=~/bin:$PATH
export PATH


#===============================================================================
# Read /etc/bashrc
#===============================================================================
# if [ -f /etc/bashrc ]; then
#     . /etc/bashrc
# fi
