#!/bin/bash
# .bashrc

# If this isn't an interactive prompt don't do anything
#[ -z "$PS1" ] && return

# Source global definitions 
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Source global definitions 
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# User specific aliases and functions

export GOPATH=$HOME/dev
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:~/.vim
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:~/bin/Sencha/Cmd/6.2.1.29/..
export PATH=$PATH:~/.npm-global/bin
export PATH=$PATH:~/Franz/packages/apache-maven-3.5.0/bin

parse_git_branch() {
    git -c color.ui=always branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="[\W]\[\033[32m\]\$(parse_git_branch)\[\033[00m\]$ "
source ~/.git-prompt.sh

export JAVA_HOME=/usr/java/jdk1.8.0_74
export _JAVA_OPTIONS="-Xms1024m -Xmx2048m"

export REACTON=true

alias bashy='source ~/.bashrc;'

alias reacton='export REACTON="true"';
alias reactoff='export REACTON="false"';

alias subgit='git submodule sync --recursive; git submodule update --init --recursive;'
alias cleancass='sudo rm /var/run/cassandra/cassandra.pid; sudo rm /var/lock/subsys/cassandra;'
alias gp=gitPush

gitPush() {
    b=$(git branch | grep \* | cut -d ' ' -f2)
    git push -u origin $b
}
