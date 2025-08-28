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

# Archivos de configuracion
	cd ~
	mkdir -p tools && cd tools
	[ -d "config_files" ] && rm -rf config_files
	git clone https://github.com/Yoswell/config_files.git

# Desktop/wallpapers directory
	cd ~/Desktop

	# Configuracion de wallpapers
		mkdir -p wallpapers && cd wallpapers
		
		cp ~/tools/config_files/wallpapers/* .

	# Configuracion de wallpaper en el login 
		sudo mv /usr/share/backgrounds/kali/kali-maze-16x9.jpg /usr/share/backgrounds/kali/kali-maze-16x9-copy.jpg
		sudo mv /usr/share/backgrounds/kali/login.svg /usr/share/backgrounds/kali/login-copy.svg

		sudo cp 2.jpg /usr/share/backgrounds/kali/kali-maze-16x9.jpg
		sudo cp 2.jpg /usr/share/backgrounds/kali/login.svg

# Documents directory
	cd ~/Documents
	mkdir {htb_academy,htb_apps,cpts,ejpt,oscp}
	
	# Clonar repositorio de writeups
		[ -d "ctf_writeups" ] &&  rm -rf ctf_writeups
		git clone https://github.com/Yoswell/ctf_writeups.git
		
	# Clonar repositorio de notas
		[ -d "obsidian_notes" ] &&  rm -rf obsidian_notes
		git clone https://github.com/Yoswell/obsidian_notes.git

# Configurar ZSH
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	cd ~/.oh-my-zsh/custom/plugins
	git clone https://github.com/zsh-users/zsh-autosuggestions.git
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

# Powerlevel10k
	cd ~/.oh-my-zsh
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

# Estilizar zshrc y kitty para root
	sudo mkdir -p /root/.config/micro/colorschemes
	sudo cp ~/tools/config_files/zshrc /root
	sudo cp ~/tools/config_files/red.micro /root/.config/micro/colorschemes

# Configurar apariencia
	cd ~/tools/config_files

	cp ~/tools/config_files/zshrc ~/.zshrc

	[ -d "mantis" ] && rm -r mantis
	tar -xf mantiNight.tar
	tar -xf darksun.tar
	
	cp -r mantiNight ~/.themes/mantiNight
	cp -r darksun ~/.themes/darksun
	
	rm mantiNight.tar && darksun.tar
	rm -r mantiNight && rm -r darksun

	mkdir -p ~/.config/micro/colorschemes
	cp red.micro ~/.config/micro/colorschemes
	cp kitty.conf ~/.config/kitty/kitty.conf

	sudo cp -f rofi/config.rasi /usr/share/rofi/themes/custom.rasi
	rm -r rofi

	sudo find . -mindepth 1 -maxdepth 1 ! -name "Windows-10-Icons" -exec rm -rf {} +

# Instalar fuentes JetBrains Mono
	mkdir -p ~/jetbrains
	cd ~/jetbrains
	mv ~/Downloads/JetBrainsMono*.zip . 2>/dev/null
	unzip -o JetBrainsMono*.zip
	sudo mkdir -p /usr/share/fonts/truetype/jetbrains-mono
	sudo mv fonts/ttf/* /usr/share/fonts/truetype/jetbrains-mono

	cd ~
	rm -rf ~/jetbrains
