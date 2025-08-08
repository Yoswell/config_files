#!/bin/bash

# ------------------------------
# Windsurf editor de codigo
# ------------------------------
sudo apt-get install wget gpg
wget -qO- "https://windsurf-stable.codeiumdata.com/wVxQEIWkwPUEAGf3/windsurf.gpg" | gpg --dearmor > windsurf-stable.gpg
sudo install -D -o root -g root -m 644 windsurf-stable.gpg /etc/apt/keyrings/windsurf-stable.gpg
echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/windsurf-stable.gpg] https://windsurf-stable.codeiumdata.com/wVxQEIWkwPUEAGf3/apt stable main" | sudo tee /etc/apt/sources.list.d/windsurf.list > /dev/null
rm -f windsurf-stable.gpg

sudo apt install apt-transport-https
sudo apt update

sudo apt install windsurf -y

# ------------------------------
# Kitty terminal
# ------------------------------
sudo apt install kitty -y

# ------------------------------
# Micro editor
# ------------------------------
cd ~/tools
curl -s https://getmic.ro | bash
sudo cp ./micro /usr/bin
rm ./micro

micro -plugin install gotham-colors
micro -plugin install editorconfig
micro -plugin install nordcolors

# ------------------------------
# lxappearance
# ------------------------------
sudo apt install lxappearance -y
