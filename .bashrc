#===============================================================================
# Export term
#===============================================================================
export TERM=xterm


#===============================================================================
# Add alias
#===============================================================================
alias .='pwd'
alias ..='cd ../ ; pwd'
alias ...='cd ../../ ; pwd'
alias ....='cd ../../../ ; pwd'
alias .....='cd ../../../../ ; pwd'
alias ......='cd ../../../../../ ; pwd'
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
alias dn='docker network ls'

alias dpr=_dockerRemoveResources
function _dockerRemoveResources() {
    if [ "$1" = "prn" ]; then
        _dockerRemovePrune
    elif [ "$1" = "con" ]; then
        _dockerRemoveContainers
    elif [ "$1" = "img" ]; then
        _dockerRemoveImages
    elif [ "$1" = "vol" ]; then
        _dockerRemoveVolumes
    elif [ "$1" = "net" ]; then
        _dockerRemoveNetworks
    elif [ "$1" = "all" ]; then
        _dockerRemoveAllForce
    else
        echo 'need target: [prn, con, vol, img, all]'
    fi
}

function _dockerRemovePrune() {
    docker container prune -f
    docker container ps -a
    docker volume prune -f
    docker volume ls
    docker image prune -f
    docker image ls
    docker network prune -f
    docker network ls
}

function _dockerRemoveContainers() {
    echo -e "\n[Containers]"
    remove_targets=`docker container ps -aq`
    test -n "$remove_targets" && docker rm -f $remove_targets
    docker container ls
}
function _dockerRemoveImages() {
    echo -e "\n[Images]"
    remove_targets=`docker image ls -q`
    test -n "$remove_targets" && docker image rm -f $remove_targets
    docker image ls
}
function _dockerRemoveVolumes() {
    echo -e "\n[Volumes]"
    remove_targets=`docker volume ls -q`
    test -n "$remove_targets" && docker volume rm -f $remove_targets
    docker volume ls
}
function _dockerRemoveNetworks() {
    echo -e "\n[Networks]"
    docker_network_list=`docker network ls | awk 'NR>1 {print $2}'`
    remove_targets=`echo -e "${docker_network_list}" | grep -v -e '^bridge$' -e '^host$' -e '^none$'`
    test -n "$remove_targets" && docker network rm $remove_targets
    docker network ls
}
function _dockerRemoveAllForce() {
    _dockerRemoveContainers
    _dockerRemoveImages
    _dockerRemoveVolumes
    _dockerRemoveNetworks
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
