# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="katnegermis"

plugins=(git command-not-found pip screen virtualenvwrapper virtualenv virtualenv-prompt)

source $ZSH/oh-my-zsh.sh

# User configuration
export PATH=$HOME/bin:/usr/local/bin:$PATH

autoload -U compinit && compinit -u


# Exports
export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
source /usr/local/bin/virtualenvwrapper_lazy.sh

## Golang
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin
export GO111MODULE=on

# add cabal dir to path (haskell-thing for pandoc)
export PATH=$HOME/.cabal/bin:$PATH
export LESS='-Ri'
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
export LC_ALL=en_US.UTF-8


# Functions
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

dockerip () {
    docker inspect "$@" | egrep '"IPAddress": "' | egrep -o '([0-9]+.[0-9]+.[0-9]+.[0-9]+)';
}

dockerrm () {
    sudo docker stop "$@" && sudo docker rm -v "$@"
}

mkvirtualenv3 () {
    mkvirtualenv --python=/usr/bin/python3 "$1" && echo "$1" > .venv
}

# Aliases
alias g=git
alias vi=vim
alias todo="vi ~/todo/todo.txt"
alias zshrc="vim ~/.zshrc"
alias o=xdg-open
alias youtube-mp3="youtube-dl --extract-audio --audio-format mp3 --audio-quality 0"
alias youtube-mp3ffmpeg="youtube-dl --extract-audio --audio-format mp3 --audio-quality 0 --prefer-ffmpeg"
alias urldecode=urldecode_alias
alias urlencode=urlencode_alias
alias pdf=pandocpdf_alias
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
alias doirssi='ssh gk -t screen -d -r irssi'
alias dco=docker-compose
alias startgamer="wakeonlan 2c:56:dc:3c:c1:ce"

## Add autojump
[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh

# fzf + ag configuration
if [ -e ~/.fzf ]; then
  export PATH=$PATH:~/.fzf/bin
  source ~/.fzf/shell/key-bindings.zsh
  source ~/.fzf/shell/completion.zsh

  export FZF_DEFAULT_COMMAND='bfs -L -nohidden 2>&/dev/null'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_CTRL_T_VI_COMMAND="vi $FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="bfs -type d -nohidden -L"
  export FZF_ALT_C_HOME_COMMAND="bfs -type d -nohidden -L ~/"
  export FZF_DEFAULT_OPTS='
  --color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108
  --color info:108,prompt:109,spinner:108,pointer:168,marker:168
  '
fi

stty -ixon

# Automatically load tmux
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && [[ -z "$NOTMUX" ]] && exec tmux

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
