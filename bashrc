# return if not running interactively
[ -z "$PS1" ] && return
. /etc/profile > /dev/null

# behave like vi
#set -o vi

# history
HISTCONTROL=ignoredups
HISTSIZE=500
shopt -s histappend
shopt -s cmdhist

# etc
shopt -s checkwinsize

export GREP_OPTIONS="--color=auto"
export GREP_COLOR="1;32"
export EDITOR="vim"

# append personal bin path
export PATH=~/bin:~/bin/exe:~/bin/bash:~/bin/mamp:~/bin/symfony:~/bin/git:~/bin/misc:$PATH

# macports bin paths
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# git paths
export GIT_HOME="/opt/local"
export PATH="$GIT_HOME/bin:$PATH"

export HOME_BIN="~"
export PATH="$HOME_BIN/bin:$PATH"

#export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:usr/X11/bin:~/bin:/usr/local:/etc/paths.d/:/etc/manpaths.d/"

# if we have git completion, use a git-aware prompt
if [ -f /usr/local/bin/git-completion.bash ]; then
  . /usr/local/bin/git-completion.bash
  PS1='\w $(__git_ps1 "(%s) ")\$ '
  else
    # use a super-minimal prompt by default
    PS1='\w \$ '
fi

# ls colors
# (via http://github.com/inky/dotfiles/blob/master/home/.bashrc)
uname=$(uname)
if [ "$TERM" != "dumb" ]; then
    case "$uname" in
    Darwin|FreeBSD)
        export CLICOLOR=1
        export LSCOLORS="ExFxCxDxBxegedabagacad"  # legible colours
        ;;
    *)
        if [ -n "`which dircolors`" ]; then
            eval "`dircolors -b`" 2>/dev/null
            alias ls='ls --color=auto' 2>/dev/null
        fi
        ;;
    esac
fi

# Include environment-specific odds-n-ends
#if [ -f ~/.bashrc.local ]; then
  #. ~/.bashrc.local
#fi

# Include alias definitions
#if [ -f ~/.bash_aliases ]; then
  #. ~/.bash_aliases
#fi