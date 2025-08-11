#!/bin/bash

# Mejorar rendimiento
	sudo echo '
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
	' > /etc/sysctl.conf 

	sudo sysctl -p

# Desinstalaciones
	sudo apt remove vim --purge
	sudo apt remove nano --purge

# Archivos de configuración
	mkdir -p ~/tools && cd ~/tools
	[ -d "config_files" ] && rm -rf config_files
	git clone https://github.com/Yoswell/config_files.git

# Configuración de wallpapers
	mkdir -p ~/Desktop/wallpapers
	cp ~/tools/config_files/wallpapers/* ~/Desktop/wallpapers

	sudo mv /usr/share/backgrounds/kali/kali-maze-16x9.jpg /usr/share/backgrounds/kali/kali-maze-16x9-copy.jpg
	sudo mv /usr/share/backgrounds/kali/login.svg /usr/share/backgrounds/kali/login-copy.svg

	sudo cp ~/Desktop/wallpapers/2.png /usr/share/backgrounds/kali/kali-maze-16x9.jpg
	sudo cp ~/Desktop/wallpapers/2.png /usr/share/backgrounds/kali/login.svg

# Clonar repositorio de Writeups de CTF
	cd ~/Documents
	[ -d "CTF_writeups" ] &&  rm -rf CTF_writeups
	git clone https://github.com/Yoswell/ctf_writeups.git

# Configurar ZSH
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	cd ~/.oh-my-zsh/custom/plugins
	git clone https://github.com/zsh-users/zsh-autosuggestions.git
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

# Powerlevel10k
	cd ~/.oh-my-zsh
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

# Crear enlace simbólico para comandos personalizados
	cd ~/tools/config_files
	sudo ln -sf comandos.txt /usr/bin/comandos
	rm -r comandos.txt

# Estilizar zshrc y kitty para root
	sudo mkdir -p /root/.config/micro/colorschemes
	sudo cp ~/tools/config_files/zshrc /root
	sudo cp ~/tools/config_files/red.micro /root/.config/micro/colorschemes

# Configurar apariencia
	cd ~/tools/config_files

	cp ~/tools/config_files/zshrc ~/.zshrc

	[ -d "mantis" ] && rm -r mantis
	unzip -o mantis.zip
	unzip -o cblack.zip
	cp -r cblack ~/.themes/cblack
	cp -r mantis/MantiNight ~/.themes/MantiNight
	rm mantis.zip && cblack.zip
	rm -r mantis && rm -r cblack

	mkdir -p ~/.config/micro/colorschemes
	cp red.micro ~/.config/micro/colorschemes
	cp kitty.conf ~/.config/kitty/kitty.conf

	[ -d "~/.icons/Colloid-Purple-Dracula-Dark" ] && rm -rf ~/.icons/Colloid-Purple-Dracula-Dark
	tar -xf icons.tar.gz
	mkdir -p ~/.icons
	mv Colloid-Purple-Dracula-Dark ~/.icons
	rm icons.tar.gz

	sudo cp -f rofi/config.rasi /usr/share/rofi/themes/custom.rasi
	rm -r rofi

# Instalar fuentes JetBrains Mono
	mkdir -p ~/jetbrains
	cd ~/jetbrains
	mv ~/Downloads/JetBrainsMono*.zip . 2>/dev/null
	unzip -o JetBrainsMono*.zip
	sudo mkdir -p /usr/share/fonts/truetype/jetbrains-mono
	sudo mv fonts/ttf/* /usr/share/fonts/truetype/jetbrains-mono

	cd ~
	rm -rf ~/jetbrains
