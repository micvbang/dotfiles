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
# Print newline after each command in shell
precmd() { print "" }
source $ZSH/oh-my-zsh.sh

# User configuration
export PATH=$HOME/bin:/usr/local/bin:$PATH

## Add autojump
[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && . ~/.autojump/etc/profile.d/autojump.sh


#### Exports
export koding='~/dropbox/koding/'
export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
source /usr/local/bin/virtualenvwrapper_lazy.sh
# Add GOPATH to PATH
export GOPATH=/home/katnegermis/dropbox/koding/go
export PATH=$PATH:$GOPATH/bin
# add cabal dir to path (haskell-thing for pandoc)
export PATH=$HOME/.cabal/bin:$PATH
export LESS=-Ri


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
    BACKUPPATH="/media/katnegermis/19C2500A39FCDBC5/"
    `backup_to`
}

backup_to_home_serv_alias() {
    BACKUPPATH="/media/katnegermis/samba/backup/"
    `backup_to`
}

backup_to() {
    DATE=$(date +%y.%m.%d-%H:%M:%S)
    rsync -va --delete --delete-excluded /media/katnegermis/storage/Dropbox/ $BACKUPPATH/backup_$DATE
}


ordnet_alias() {
    xdg-open "http://ordnet.dk/ddo/ordbog?query="$@
}

pandocpdf_alias() {
    filename="${1%.*}"

    pandoc $1 -o $filename.pdf -V geometry:margin=1.5in
}


#### Aliases
alias todo="vi ~/dropbox/todo.txt"
alias se=/media/katnegermis/storage/dropbox/koding/python/series_everything/tvshowhelper.py
alias s=subl
alias zshrc="s ~/.zshrc"
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
alias apnews='its -b 56094'
alias sanews='its -b 56120'
alias nots='its -n'

# Load the secret stuff
source ~/.zshrc_secret
. /usr/share/autojump/autojump.sh
