# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# set tab completion for: file, yroot and git
set autolist
if [ -f /home/y/etc/yroot/yroot.bashrc ]; then
    . /home/y/etc/yroot/yroot.bashrc
fi
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Set terminal type (for 256 color support)
if [ $TERM = 'screen' ]; then
    export TERM=xterm-256color
fi

# set prompt (show YROOT_NAME when available)
if [ "x$YROOT_NAME" == "x" ]; then
    PS1="\[\e[1;38;5;37m\][\h:\W]\$ \[\e[0;38;5;244m\]"
    #PS1="\[\e[0;36m\][\h:\W]\$ \[\e[0;32m\]"
else
    PS1="\[\e[1;38;5;37m\][\[\e[1;38;5;136m\]$YROOT_NAME:\[\e[1;38;5;37m\]\W]\$ \[\e[0;38;5;244m\]"
fi
export PS1

# Set ls colors
eval `dircolors /home/sge/.dir_colors_256dark`

#set java path
export JAVA_HOME="/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.51-1.b16.el6_7.x86_64"

#set PATH, avoid duplicate
PATH_TO_ADD="/home/y/bin:/usr/sbin:."
for DIR in $(echo $PATH_TO_ADD | tr ":" "\n")
do
    if ! [[ $PATH =~ (^|:)"$DIR"(:|$) ]];
    then
        export PATH="$DIR":$PATH
    fi
done
unset DIR

# Set up and down arrows for command history
if [ -t 1 ]; then    # when doing scp, this part will not be excuted
    bind '"\e[A": history-search-backward'
    bind '"\e[B": history-search-forward'
    # Enable forward command history searching by ctrl-s
    stty -ixon
fi

#set aliases
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias ..5='cd ../../../../..'
alias ..6='cd ../../../../../..'
alias ls='ls --color=tty'
alias ll='ls -l'
alias llt='ls -lt'
alias rm='rm -i'
alias intellij='/home/sge/bin/idea-IC-143.381.42/bin/idea.sh'

# Some settings for yroot sesstion
if [ "$YROOT_NAME" = "ufe_build" ]; then
    export PYTHONPATH=$PATHONPATH:.
fi
