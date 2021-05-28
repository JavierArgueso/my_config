export ZSH="/home/javier/.oh-my-zsh"
export PATH="$PATH:`pwd`/flutter/bin"

ZSH_THEME="bira"

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias docker="sudo docker"

alias v="nvim"
alias vz="nvim ~/.zshrc"
alias vv="nvim /home/javier/.config/nvim/.vimrc"
alias vb="nvim ~/.config/bspwm/bspwmrc"
alias vs="nvim ~/.config/sxhkd/sxhkdrc"

alias clear="clear && ~/my_config/ufetch-ubuntu"

alias deth="source /tools/Xilinx/Vitis/2019.2/settings64.sh"

alias upd=$HOME/my_config/update.sh

~/my_config/ufetch-ubuntu
