#!/bin/sh

# Comprobacion de sistema
echo "Introduzca tipo de linux (1. Debian, 2. Arch)"
read opcion

# Actualizacion e instalacion de aplicaciones
if (opcion == 1) then

  echo "\nActualizando sistema"
  sudo apt update && sudo apt upgrade -y

  echo "\nInstalando programas"
  sudo apt install neovim neofetch zsh w3m-img imagemagick xdotool git curl

elif (opcion == 2) then

  echo "\nActual sistema"
  yay -Syyu

  echo "\nInstalando programas"
  yay -S neovim ufetch zsh xdotool git curl

fi

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


