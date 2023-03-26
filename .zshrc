export ZSH=/usr/share/oh-my-zsh
ZSH_THEME="amuse"

fpath=(/usr/share/zsh/site-functions $fpath)

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

[[ -f ~/.profile ]] \
    && source ~/.profile

# https://wiki.archlinux.org/index.php/Dotfiles#Tracking_dotfiles_directly_with_Git
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
compdef dotfiles='git'

