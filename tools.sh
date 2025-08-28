#!/bin/bash

# Windsurf editor de codigo
	sudo apt-get install wget gpg
	wget -qO- "https://windsurf-stable.codeiumdata.com/wVxQEIWkwPUEAGf3/windsurf.gpg" | gpg --dearmor > windsurf-stable.gpg
	sudo install -D -o root -g root -m 644 windsurf-stable.gpg /etc/apt/keyrings/windsurf-stable.gpg
	echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/windsurf-stable.gpg] https://windsurf-stable.codeiumdata.com/wVxQEIWkwPUEAGf3/apt stable main" | sudo tee /etc/apt/sources.list.d/windsurf.list > /dev/null
	rm -f windsurf-stable.gpg

# Micro editor
	cd ~/tools
	curl -s https://getmic.ro | bash
	sudo cp ./micro /usr/bin
	rm ./micro

	micro -plugin install gotham-colors
	micro -plugin install editorconfig
	micro -plugin install nordcolors

# Gdb plugins binary analizer
	sudo apt install gdb-peda -y
	curl -qsL 'https://install.pwndbg.re' | sh -s -- -t pwndbg-gdb
	bash -c "$(curl -fsSL https://gef.blah.cat/sh)"

# Apt install tools
	sudo apt update
	sudo apt install spand -y
	sudo apt install rlwrap -y
	sudo apt install remmina -y
	sudo apt install caido -y
	sudo apt install stegseek -y
	sudo apt install pngcheck -y
	sudo apt install sqlitebrowser -y
	sudo apt install cmake -y
	sudo apt install ghidra -y
	sudo apt install checksec -y 
	sudo apt install stegsnow -y
	sudo apt install lxappearance -y
	sudo apt install rofi -y
	sudo apt install kitty -y
	sudo apt install apt-transport-https
	sudo apt install windsurf -y

# Ctf tools pip
	pip install oletools --break-system-packages
	pip install stego-lsb --break-system-packages
	pip install pwntools --break-system-packages
	pip install ciphey --upgrade --break-system-packages
	pip install pycryptodome --break-system-package
	pip install decompyle3 --break-system-packages
	pip install decompyle6 --break-system-packages
	pip3 install pypykatz --break-system-packages
	pip3 install defaultcreds-cheat-sheet --break-system-package
	pip3 install stegoveritas --break-system-packages
	stegoveritas_install_deps

# Sonic visualizer
	mkdir ctftools && cd ctftools
	curl -O https://code.soundsoftware.ac.uk/attachments/download/2880/SonicVisualiser-5.2.1-x86_64.AppImage
	mv SonicVisualiser-5.2.1-x86_64.AppImage sonic.AppImage
	chmod +x sonic.AppImage

# JdGui
	curl -O https://github.com/java-decompiler/jd-gui/releases/download/v1.6.6/jd-gui-1.6.6.jar
	mv jd-gui-1.6.6.jar jdGui.jar
	chmod +x jdGui.jar

# Stegsolve
	wget http://www.caesum.com/handbook/Stegsolve.jar -O stegsolve.jar
	chmod +x stegsolve.jar

# Jsteg
	sudo wget -O /usr/bin/jsteg https://github.com/lukechampine/jsteg/releases/download/v0.1.0/jsteg-linux-amd64
	sudo chmod +x /usr/bin/jsteg
	
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

# Audio stego
	sudo apt-get install libboost-all-dev
	git clone https://github.com/danielcardeenas/AudioStego.git
	cd AudioStego
	mkdir build && cd build
	cmake ..
	make
	sudo ln -sf ~/tools/ctftools/AudioStego/build/hideme /usr/bin/hideme

# LSB Steganografhy
	cd ~/tools/ctftool
	git clone https://github.com/RobinDavid/LSB-Steganography.git
	cd LSB-Steganography
	pip install -r requirements.txt --break-system-packages

# Masscan
	cd ~/tools/ctftools
	git clone https://github.com/robertdavidgraham/masscan.git
	cd masscan
	make

# Pycdc
	cd ~/tools/ctftools
	git clone https://github.com/zrax/pycdc.git
	cd pycdc
	mkdir build && cd build
	cmake ..
	make

# Rutscan
	sudo snap install rustscan
