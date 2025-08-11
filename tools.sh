#!/bin/bash

# Windsurf editor de codigo
	sudo apt-get install wget gpg
	wget -qO- "https://windsurf-stable.codeiumdata.com/wVxQEIWkwPUEAGf3/windsurf.gpg" | gpg --dearmor > windsurf-stable.gpg
	sudo install -D -o root -g root -m 644 windsurf-stable.gpg /etc/apt/keyrings/windsurf-stable.gpg
	echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/windsurf-stable.gpg] https://windsurf-stable.codeiumdata.com/wVxQEIWkwPUEAGf3/apt stable main" | sudo tee /etc/apt/sources.list.d/windsurf.list > /dev/null
	rm -f windsurf-stable.gpg

	sudo apt install apt-transport-https
	sudo apt update
	sudo apt install windsurf -y

# Kitty terminal
	sudo apt install kitty -y

# Micro editor
	cd ~/tools
	curl -s https://getmic.ro | bash
	sudo cp ./micro /usr/bin
	rm ./micro

	micro -plugin install gotham-colors
	micro -plugin install editorconfig
	micro -plugin install nordcolors

# lxappearance tweaks
	sudo apt install lxappearance -y

# Rofi launcher
	sudo apt install rofi -y

# Gdb plugins binary analizer
	sudo apt install gdb-peda -y
	curl -qsL 'https://install.pwndbg.re' | sh -s -- -t pwndbg-gdb
	bash -c "$(curl -fsSL https://gef.blah.cat/sh)"

# Ghidra dissasemble
	sudo apt install ghidra -y

# Checksec
	sudo apt install checksec -y 

# Ctf tools pip
	pip install oletools --break-system-packages
	pip install stego-lsb --break-system-packages
	pip install pwntools --break-system-packages
	pip install ciphey --upgrade --break-system-packages
	pip3 install stegoveritas --break-system-packages
	stegoveritas_install_deps
	pip3 install pypykatz --break-system-packages

# Sonic visualizer
	mkdir ctftools && cd ctftools
	curl -O https://code.soundsoftware.ac.uk/attachments/download/2880/SonicVisualiser-5.2.1-x86_64.AppImage
	mv SonicVisualiser-5.2.1-x86_64.AppImage sonic.AppImage
	upx sonic.AppImage

# JdGui
	curl -O https://github.com/java-decompiler/jd-gui/releases/download/v1.6.6/jd-gui-1.6.6.jar
	mv jd-gui-1.6.6.jar jdGui.jar
	upx jdGui.jar

# Sqlite browser
	curl -O https://github.com/sqlitebrowser/sqlitebrowser/releases/download/v3.13.1/DB.Browser.for.SQLite-v3.13.1-x86.64-v2.AppImage
	mv DB.Browser.for.SQLite-v3.13.1-x86.64-v2.AppImage sqliteBrowser.AppImage
	upx sqliteBrowser.AppImage

# Cmake
	sudo apt install cmake -y
	
# Pdf cracker
	git clone https://github.com/MichaelSasser/pdfcrack-ng.git
	cd pdfcrack-ng
	mkdir build && cd build
	cmake ..
	make

# Binaryninja
	cd ~/tools/ctftools
	curl -O https://cdn.binary.ninja/installers/binaryninja_free_linux.zip
	unzip binaryninja_free_linux.zip

# Stego
	gem install zsteg

# Stegseek
	sudo apt install stegseek -y

# Png check
	sudo apt install pngcheck

# Audio stego
	sudo apt-get install libboost-all-dev
	git clone https://github.com/danielcardeenas/AudioStego.git
	cd AudioStego
	mkdir build && cd build
	cmake ..
	make
	upx hideme
	sudo ln -sf ~/tools/ctftools/AudioStego/build/hideme /usr/bin/hideme

# LSB Steganografhy
	cd ~/tools/ctftool
	git clone https://github.com/RobinDavid/LSB-Steganography.git
	cd LSB-Steganography
	pip install -r requirements.txt --break-system-packages
	
# Caido
	sudo apt install caido -y

# Masscan
	git clone https://github.com/robertdavidgraham/masscan.git
	cd masscan
	make

# Remmina 
	sudo apt install remmina -y
