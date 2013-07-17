# listing

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more listing aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'


# vim
alias vi='vim'

# git
alias gitd="git diff"
alias gits="git status"
alias gitb="git branch"
alias gtfo="git fetch origin"
alias gpo="git push origin"
alias gmodev="git merge origin/develop"
alias gmomstr="git merge origin/master"


# symfony
#alias sf="./symfony"
#alias sbar="./symfony doctrine:build --all --and-load"
#alias scc="./symfony cc"
#alias sccbar="./symfony cc;./symfony doctrine:build --all --and-load --no-confirmation"
#alias sdl="./symfony doctrine:data-load"
#function sdmod() { ./symfony doctrine:generate-module --with-show --non-verbose-templates $1 $2 $3; }
#function soa() { ./symfony optimize:assets $1;./symfony cc; }

# apache/mysql/php
#alias apacherestart='sudo service apache2 restart'
#alias apachestop='sudo service apache2 stop'
#alias apachestart='sudo service apache2 start'
#alias mysqlrestart='sudo service mysql restart'
#alias mysqlstart='sudo service mysql start'
#alias mysqlstop='sudo service mysql stop'

# etc
  #alias bashrc="vim ~/.bashrc"
  #alias vimrc="vim ~/.vimrc"
  #alias dl="curl -O"
  #alias dspace="du -k -s -h * | sort -k1 -g -r"
  #alias flushcache="sudo dscacheutil -flushcache"
  #alias reload="source ~/.bashrc"

  # `.. 3` will `cd ../../..`
  #function ..() {
      #local arg=${1:-1}; while [ $arg -gt 0 ]; do
          #local dir="$dir../"; arg=$(($arg - 1))
      #done
      #cd $dir >& /dev/null;
  #}

# ssh
#alias sagent='keychain ~/.ssh/id_rsa_iostudio; source ~/.keychain/kyle-OptiPlex-390-sh'
#alias kagent='keychain -k'

alias ruby="ruby -rubygems"
