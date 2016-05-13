# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="katnegermis"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git command-not-found pip screen virtualenvwrapper virtualenv virtualenv-prompt)

source $ZSH/oh-my-zsh.sh

# User configuration
export PATH=$HOME/bin:/usr/local/bin:$PATH

## Add autojump

[[ -s /home/katnegermis/.autojump/etc/profile.d/autojump.sh ]] && source /home/katnegermis/.autojump/etc/profile.d/autojump.sh

# Automatically load tmux
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux

#### Exports
export koding='~/dropbox/koding/'
export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
source /usr/local/bin/virtualenvwrapper_lazy.sh
# Add GOPATH to PATH
export GOPATH=/home/katnegermis/dropbox/koding/go
export GOBIN=/opt/go/bin
export GOROOT=/opt/go
#export GOPATH=/usr/local/go
export PATH=$PATH:/opt/go/bin
export SCALA_HOME=/opt/scala-2.11.8/
export PATH=$PATH:$SCALA_HOME/bin/
# add cabal dir to path (haskell-thing for pandoc)
export PATH=$HOME/.cabal/bin:$PATH
export PATH=$PATH:/opt/genymobile/genymotion
export PATH=$PATH:/opt/ida
export LESS='-Ri'
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
export GREP_OPTIONS="--color=always"


#### Function declarations
godoc_alias() {
    godoc "$@" | less
}
urldecode_alias() {
    python -c "import urllib, sys; print urllib.unquote(sys.argv[1])" "$@"
}
urlencode_alias() {
    python -c "import urllib, sys; print urllib.quote(sys.argv[1])" "$@"
}

backup_to_hdd_alias() {
    BACKUPPATH="hjemme:/media/storage2/samba/backup/dropbox/"
    `backup_to`
}

backup_to_home_serv_alias() {
    BACKUPPATH="hjemme:/media/storage2/samba/backup/dropbox/"
    `backup_to`
}

backup_to() {
    DATE=$(date +%y.%m.%d-%H:%M:%S)
    rsync -va --delete --delete-excluded /media/katnegermis/storage/Dropbox/ $BACKUPPATH/backup_$DATE
}

todo_today_alias() {
    DATE=$(date +%y.%m.%d)
    vim ~/todo/todo_$DATE
}

ordnet_alias() {
    xdg-open "http://ordnet.dk/ddo/ordbog?query="$@
}


#### Aliases
alias vi=vim
alias todo="vi ~/todo/todo.txt"
alias se=/media/katnegermis/storage/dropbox/koding/python/series_everything/tvshowhelper.py
alias wn="se $@ --watch-next"
alias s="apt-cache search"
alias zshrc="vim ~/.zshrc"
alias o=xdg-open
alias sshfs_do="sshfs do:/home/katnegermis/downloads /media/katnegermis/server"
alias backuphdd=backup_to_hdd_alias
alias backupsrv=backup_to_home_serv_alias
alias backupdo="rsync -r -u /media/katnegermis/storage/dropbox/ do:/home/katnegermis/backup --progress"
alias youtube-mp3="youtube-dl --extract-audio --audio-format mp3 --audio-quality 0"
alias youtube-mp3ffmpeg="youtube-dl --extract-audio --audio-format mp3 --audio-quality 0 --prefer-ffmpeg"
alias urldecode=urldecode_alias
alias urlencode=urlencode_alias
alias godoc=godoc_alias
alias ordnet=ordnet_alias
alias pdf=pandocpdf_alias
alias nots='its -n'
alias todotoday=todo_today_alias
alias v=vim
alias cb='xclip -sel clip'

alias lsa='ls -lah'
alias l='ls'
alias ll='ls -lh'
alias la='ls -lAh'
alias sshpw='ssh -o PreferredAuthentications=password'
alias scppw='scp -o PreferredAuthentications=password '
alias ord='python /home/katnegermis/koding/python/ordbogen.com/main.py '
alias suspend='sudo pm-suspend'
alias arbtt-stats-today='arbtt-stats --filter "\$date >= $(date +%Y-%m-%d)"'
alias arbtt-stats-24h='arbtt-stats --filter "\$sampleage <= 24:00"'
# alias ida64='wine ~/.wine/drive_c/Program\ Files\ \(x86\)/IDA\ 6.5/idaq64.exe'
# alias ida='wine ~/.wine/drive_c/Program\ Files\ \(x86\)/IDA\ 6.5/idaq.exe'
alias i='sudo apt-get install'
alias wifi='sudo nmcli nm wifi '
alias wificonnect='nmcli dev wifi connect "$1" iface wlan0 '
alias doirssi='ssh do -t screen -d -r irssi'
alias mdsec='egrep -e "^(-------|=======|#{2,6})" -B 1 -A0 --color=never'
alias mibado='ssh do -t ssh miba'
alias mibahjemme='ssh hjemme -t ssh miba'


# Load the secret stuff
source ~/.zshrc_secret
#. /usr/share/autojump/autojump.sh

# Set dynamic terminal title in urxvt
case "$TERM" in
 xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]"
    ;;
 *)
    ;;
esac

# Add git-stuff to tmux status bar.
source ~/dotfiles/.tmux-git/tmux-git.sh
precmd() {
    update_tmux
}

stty -ixon

# if [ -f ~/.zsh_completion ]; then
#     . ~/.zsh_completion
# fi
