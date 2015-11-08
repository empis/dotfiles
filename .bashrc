#
# ~/.bashrc
#
export TERM="rxvt-unicode-256color"
export PATH="${PATH}:/usr/bin"
export XDG_DATA_HOME="/home/$USER/.local/share"
export XDG_CONFIG_HOME="/home/$USER/.config"
export XDG_CACHE_HOME="/home/$USER/.cache"
export XDG_DOWNLOAD_DIR="/home/$USER/Downloads"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/lib64:/usr/lib32"
export EDITOR='vim'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
export LANGUAGE="sk"
alias ls='ls --color=auto'
alias home="cd ~/"
alias upgrade='yaourt -Syu --aur --devel'
alias torrents='transmission-remote-cli -c xenogia:dot.dot.dot@z1lt0id.dontexist.com:9091'
alias updategit="git push -u origin master"
alias disk="dfc"
alias v="vim"
alias rpi="ssh empis@192.168.4.3"
alias c="compile"
alias skola="cd /home/empis/Dokumenty/Škola/C++/Zdrojové\ kódy/"
# Color support
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
fi

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Auto-completion
 if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
 fi

# Color man pages
man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
			man "$@"
}

# Colored prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# sanitize - set file/directory owner and permissions to normal values (644/755)
# Usage: sanitize <file>
sanitize() {
    chmod -R u=rwX,go=rX "$@"
    chown -R ${USER}.users "$@"
}

extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

#compile
compile (){
	filename=$(basename $1);
	name=${filename%.*}
	dir=$(dirname $1);
	compiledir=$dir"/Compile/";
	if !  [ -e $dir"/Compile" ]; then
		mkdir $dir"/Compile/";
	fi
	case $1 in
		*.cpp) g++ $1 -o $dir"/Compile/"$name;;

	esac
}

#PS1="\[\e[01;31m\]┌─[\t]──[\[\e[01;31m\u\e[01;31m\]]──[\[\e[00;31m\]${HOSTNAME%%.*}\[\e[01;31m\]]:\w$\[\e[01;31m\]\n\[\e[01;37m\]└──\[\e[01;37m\](\[\e[32;1m\]\$(/bin/ls 
#-1 | /usr/bin/wc -l | /bin/sed 's: ::g') files, \$(/usr/bin/ls -lah | /usr/bin/grep -m 1 total | /usr/bin/sed 
#'s/total //')b\[\e[01;37m\])>>\[\e[0m\]"
screenfetch
#archinfo --Art=graffiti --art-color=cyan --label-color=white --data-color=green --set editor=vim

# Yavide alias
alias yavide="gvim --servername yavide -f -N -u /opt/yavide/.vimrc"
