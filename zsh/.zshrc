export ZSH="/home/javier/.oh-my-zsh"

ZSH_THEME="bira"

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias v="nvim"
alias vz="nvim ~/.zshrc"
alias vv="nvim /home/javier/.config/nvim/.vimrc"
alias vb="nvim ~/.config/bspwm/bspwmrc"

alias clear="clear && ~/my_config/ufetch-ubuntu"

alias upd=$HOME/my_config/update.sh

~/my_config/ufetch-ubuntu
