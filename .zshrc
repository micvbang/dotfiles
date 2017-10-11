# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="katnegermis"

plugins=(git command-not-found pip screen virtualenvwrapper virtualenv virtualenv-prompt)

source $ZSH/oh-my-zsh.sh

# User configuration
export PATH=$HOME/bin:/usr/local/bin:$PATH

## Add autojump

[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh

autoload -U compinit && compinit -u


#### Exports
export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
source /usr/local/bin/virtualenvwrapper_lazy.sh

# Add GOPATH to PATH
export GOPATH=~/coding/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin

# add cabal dir to path (haskell-thing for pandoc)
export PATH=$HOME/.cabal/bin:$PATH
export LESS='-Ri'
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim


#### Function declarations
urldecode_alias() {
    python -c "import urllib, sys; print urllib.unquote(sys.argv[1])" "$@"
}
urlencode_alias() {
    python -c "import urllib, sys; print urllib.quote(sys.argv[1])" "$@"
}

todo_today_alias() {
    DATE=$(date +%y.%m.%d)
    vim ~/todo/todo_$DATE
}

dockerip () { docker inspect "$@" | egrep '"IPAddress": "' | egrep -o '([0-9]+.[0-9]+.[0-9]+.[0-9]+)'; }
dockerrm () { sudo docker stop "$@" && sudo docker rm -v "$@" }

#### Aliases
alias vi=vim
alias todo="vi ~/todo/todo.txt"
alias ttodo="vi ~/thesis/dump/notes.md"
alias se=~/coding/python/series_everything/tvshowhelper.py
alias wn="se $@ --watch-next"
alias zshrc="vim ~/.zshrc"
alias o=xdg-open
alias youtube-mp3="youtube-dl --extract-audio --audio-format mp3 --audio-quality 0"
alias youtube-mp3ffmpeg="youtube-dl --extract-audio --audio-format mp3 --audio-quality 0 --prefer-ffmpeg"
alias urldecode=urldecode_alias
alias urlencode=urlencode_alias
alias pdf=pandocpdf_alias
alias todotoday=todo_today_alias
alias v=vim
alias cb='xclip -sel clip'

alias lsa='ls -lah'
alias l='ls'
alias ll='ls -lh'
alias la='ls -lAh'
alias sshpw='ssh -o PreferredAuthentications=password'
alias scppw='scp -o PreferredAuthentications=password '
alias ord='~/coding/python/ordbogen_free/ord.py '
alias suspend='sudo pm-suspend'
alias wifi='sudo nmcli nm wifi '
alias wificonnect='nmcli dev wifi connect "$1" iface wlan0 '
alias doirssi='ssh gk -t screen -d -r irssi'
alias dco=docker-compose
dockerclean() { sudo docker volume ls -qf dangling=true | xargs -r docker volume rm; }
alias sz=streamzor-cli
dockerip () { sudo docker inspect "$@" | egrep '"IPAddress": "' | egrep -o '([0-9]+.[0-9]+.[0-9]+.[0-9]+)'; }

alias startgamer="wakeonlan 2c:56:dc:3c:c1:ce"


# Add git-stuff to tmux status bar.
source ~/dotfiles/.tmux-git/tmux-git.sh
precmd() {
    update_tmux
}

stty -ixon
#
# Automatically load tmux
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && [[ -z "$NOTMUX" ]] && exec tmux
