export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Define functions and completions.
function md() { [[ $# == 1 ]] && mkdir -p -- "$1" && cd -- "$1" }
compdef _directories md

# Define aliases.
alias tree='tree -a -I .git'

# Add flags to existing aliases.
alias ls="${aliases[ls]:-ls} -A"

# Set shell options: http://zsh.sourceforge.net/Doc/Release/Options.html.
setopt glob_dots     # no special treatment for file names with a leading dot
setopt no_auto_menu  # require an extra TAB press to open the completion menu

#################
# Personal config
#################

alias vi=nvim
alias vim=nvim
alias g=git
alias o=xdg-open
alias v=aws-vault
alias m=mise
alias cb='xclip -sel clip'
alias dco=docker-compose

export GOPRIVATE="git.haps.pw/*,gitlab.com/micvbang/*"

eval "$(/home/micvbang/.local/bin/mise activate zsh)"

source <(fzf --zsh)
