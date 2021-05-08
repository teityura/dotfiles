# Add alias
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias l='ls -al --color=auto'
alias ll='ls -al --color=auto'
alias lll='ls -al --color=auto'
alias grep='grep --color=auto'
alias lessf='less +F'
alias py2='python2'
alias py3='python3'
alias py='python3'
alias man='env LANG=ja_JP.utf8 man'

# Export PATH
if [ ! -d $HOME/bin ]
    mkdir $HOME/bin
end
set -x PATH $PATH $HOME/bin

# Set LANG
if locale -a | grep '^ja_JP\.utf8$' > /dev/null
    set -x LANG ja_JP.UTF-8
else
    set txt "$txt" "\n" '[ja_JP.utf8] does not exist'
    set txt "$txt" "\n" 'plz install [ja_JP.utf8]'
    set txt "$txt" "\n" 'ubuntu: apt-get install language-pack-ja'
end

# Start ssh-agent
#eval (ssh-agent -c)
#ssh-add ~/.ssh/github_rsa

# Exit shells
#function on_exit --on-process %self
#    ssh-agent -k
#end

# Start echo
if [ -n "$txt" ]
    set SEPL (for i in (seq 1 (tput cols)) ; echo -n '#' ; end ; echo ;)
    echo $SEPL
    echo -e "$txt" | awk NF
    echo $SEPL
end
# End echo
