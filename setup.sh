#!/bin/bash

# ------------------------------
# Mejorar rendimiento
# ------------------------------
sudo tee -a /etc/sysctl.conf >/dev/null <<EOL
vm.swappiness = 10
vm.vfs_cache_pressure = 50
vm.dirty_ratio = 3
vm.dirty_background_ratio = 5
vm.watermark_scale_factor = 200
vm.page-cluster = 3
vm.min_free_kbytes = 65536
vm.dirty_writeback_centisecs = 1500
vm.dirty_expire_centisecs = 3000
kernel.sched_latency_ns = 6000000
kernel.sched_min_granularity_ns = 750000
kernel.sched_wakeup_granularity_ns = 1000000
EOL

sudo sysctl -p

# ------------------------------
# Configuración de wallpapers
# ------------------------------
mkdir -p ~/Desktop/wallpapers
cp ~/tools/config_files/wallpapers/* ~/Desktop/wallpapers

sudo mv /usr/share/backgrounds/kali/kali-maze-16x9.jpg /usr/share/backgrounds/kali/kali-maze-16x9-copy.jpg
sudo mv /usr/share/backgrounds/kali/login.svg /usr/share/backgrounds/kali/login-copy.svg

sudo cp ~/Desktop/wallpapers/2.png /usr/share/backgrounds/kali/kali-maze-16x9.jpg
sudo cp ~/Desktop/wallpapers/2.png /usr/share/backgrounds/kali/login.svg

# ------------------------------
# Clonar repositorio de Writeups de CTF
# ------------------------------
cd ~/Documents
[ -d "CTF_writeups" ] &&  rm -rf CTF_writeups
git clone https://github.com/Yoswell/ctf_writeups.git

# ------------------------------
# Archivos de configuración
# ------------------------------
mkdir -p ~/tools && cd ~/tools
[ -d "config_files" ] && rm -rf config_files
git clone https://github.com/Yoswell/config_files.git

# ------------------------------
# Configurar ZSH
# ------------------------------
cp ~/tools/config_files/zshrc ~/.zshrc

# Instalar plugins para ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cd ~/.oh-my-zsh/custom/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

# ------------------------------
# Configurar tema personalizado para Rofi
# ------------------------------
sudo cp -f ~/tools/config_files/rofi/config.rasi /usr/share/rofi/themes/custom.rasi

# ------------------------------
# Crear enlace simbólico para comandos personalizados
# ------------------------------
sudo ln -sf ~/tools/config_files/comandos.txt /usr/bin/comandos

# ------------------------------
# Estilizar zshrc y kitty para root
# ------------------------------
sudo mkdir -p /root/.config/micro/colorschemes
sudo cp ~/tools/config_files/zshrc /root
sudo cp ~/tools/config_files/red.micro /root/.config/micro/colorschemes

# ------------------------------
# Configurar apariencia
# ------------------------------
cd ~/tools/config_files
[ -d "mantis" ] && rm -r mantis
unzip -o mantis.zip
cp -r mantis/MantiDusk ~/.themes
cp -r mantis/MantiNight ~/.themes

mkdir -p ~/.config/micro/colorschemes
cp ~/tools/config_files/red.micro ~/.config/micro/colorschemes
cp ~/tools/config_files/kitty.conf ~/.config/kitty/kitty.conf
rm mantis.zip
rm -r mantis

[ -d "~/.icons/Colloid-Purple-Dracula-Dark" ] && rm -rf ~/.icons/Colloid-Purple-Dracula-Dark
tar -xf icons.tar.gz
mkdir -p ~/.icons
mv Colloid-Purple-Dracula-Dark ~/.icons
rm icons.tar.gz

# ------------------------------
# Instalar fuentes JetBrains Mono
# ------------------------------
mkdir -p ~/jetbrains
cd ~/jetbrains
mv ~/Downloads/JetBrainsMono*.zip . 2>/dev/null
unzip -o JetBrainsMono*.zip
sudo mkdir -p /usr/share/fonts/truetype/jetbrains-mono
sudo mv fonts/ttf/* /usr/share/fonts/truetype/jetbrains-mono

cd ~
rm -rf ~/jetbrains
