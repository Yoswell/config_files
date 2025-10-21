#!/bin/bash

# Desinstalaciones
	cd ~
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
		sudo cp 6.jpg /usr/share/backgrounds/kali/kali-maze-16x9.jpg
		sudo cp 6.jpg /usr/share/backgrounds/kali/login.svg

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
	cd ~/.oh-my-zsh/custom/plugins
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
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

	sudo cp -f custom.rasi /usr/share/rofi/themes/custom.rasi

# Instalar fuentes JetBrains Mono
	mkdir -p ~/jetbrains
	cd ~/jetbrains
	mv ~/Downloads/JetBrainsMono*.zip . 2>/dev/null
	unzip -o JetBrainsMono*.zip
	sudo mkdir -p /usr/share/fonts/truetype/jetbrains-mono
	sudo mv fonts/ttf/* /usr/share/fonts/truetype/jetbrains-mono

	cd ~
	rm -rf ~/jetbrains
