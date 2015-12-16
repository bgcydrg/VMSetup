#set auto complete
set autolist
if(-X yroot) complete yroot 'c/--/(create images list local-home mount ps remove rename restart set setup-amd start stop umount unset update)/' 'p@*@D:/home/y/var/yroots@@'

#Set path
set DIR_LIST = "/home/y/bin:/usr/sbin:."
foreach DIR (`echo $DIR_LIST | tr ":" " "`)
    set FOUND = (`echo $PATH | tr ":" "\n" | grep -x $DIR`)
    if !($FOUND == $DIR) then
        setenv PATH ${PATH}:$DIR
    endif
end
unset DIR_LIST
unset DIR
unset FOUND

#Set prompt
if (!($?YROOT_NAME)) then
    set prompt="%{\033[1;36m%}[%m:%~]%{\033[0m%} "
else
    set prompt="%{\033[1;36m%}[%{\033[1;33m%}${YROOT_NAME}%{\033[1;36m%}:%~]%{\033[0m%} "
endif

#Set up and down arrows for history command
bindkey -k up history-search-backward
bindkey -k down history-search-forward

#Set aliases
alias ..  'cd ..'
alias ..2 'cd ../..'
alias ..3 'cd ../../..'
alias ..4 'cd ../../../..'
alias ..5 'cd ../../../../..'
alias ..6 'cd ../../../../../..'
alias ls 'ls -G'
alias ll 'ls -l'
alias llt 'ls -lt'
alias rm 'rm -i'
alias emacs ~/bin/emacs.sh
alias vncstart 'vncserver :1 -geometry 1920x1200'
alias vncend 'vncserver -kill :1'
