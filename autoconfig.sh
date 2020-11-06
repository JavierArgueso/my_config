#!/bin/sh

# Instalando programas
echo "\nActualizando sistema"
sudo apt update && sudo apt upgrade -y

echo "\nInstalando programas"
sudo apt install neovim zsh w3m-img imagemagick xdotool curl bspwm sxhkd rofi htop suckless-tools

# Coniguracion de git
echo "\nConfigurando git"
git config --global user.email "javierarguesosoto@gmail.com"
git config --global user.name "JavierArgueso"

# Widget Desktop
echo "\nDescargando e instalando el visor de escritorios"
git clone https://github.com/wsdfhjxc/virtual-desktop-bar.git
$HOME/virtual-desktop-bar/scripts/install-dependencies-ubuntu.sh
$HOME/virtual-desktop-bar/scripts/install-applet.sh

# Configuracion de las aplicaciones
echo "\nConfigurando zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "\nConfigurando nvim"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo "\nCopiando el inicio con Plasma y BSPWM en /usr/share/xsessions"
sudo cp ./plasmaBSPWM.desktop /usr/share/xsessions/

echo "\nCreando carpeta y copiando conguracion de bspwm"
mkdir $HOME/.config/bspwm
cp ./bspwm/bspwmrc $HOME/.config/bspwm/

echo "\nCreando carpeta y copiando configuracion de sxhkd"
mkdir $HOME/.config/sxhkd
cp ./sxhkd/sxhkdrc $HOME/.config/sxhkd/

echo "\nGuardando los wallpapers"
cp -r ./wallpapers $HOME/.local/share/

echo "\nCreando carpeta y copiando dotFiles de nvim"
mkdir $HOME/.config/nvim
cp ./nvim/init.vim $HOME/.config/nvim/
cp ./nvim/.vimrc $HOME/.config/nvim/

echo "\nA continuación se van a instalar los plugins de nvim"
nvim +PlugInstall

echo "\nAhora es necesario que instale los componentes de Coc"
echo "coc-texlab"
echo "coc-python"
echo "coc-html"
echo "coc-css"
echo "coc-json"
echo "coc-tsserver"
