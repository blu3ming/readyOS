#!/bin/bash

cd
echo -e "\n[*] Actualizando el sistema..."
sleep 5
apt update
apt upgrade
echo -e "\n[*] Sistema actualizado, instalando Sublime..."
sleep 5
apt install apt-transport-https ca-certificates curl software-properties-common
sudo add-apt-repository "deb https://download.sublimetext.com/ apt/stable/"
apt update
apt install sublime-text
echo -e "\n[*] Sublime instalado"
echo "[*] Instalando OhMyTmux..."
sleep 5
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
echo -e "\n[*] OhMyTmux instalado"
echo "[*] Instalando extractPorts y mkt..."
sleep 5
curl -S https://raw.githubusercontent.com/blu3ming/readyOS/main/functions_for_zshrc >> ~/.zshrc
curl -S https://raw.githubusercontent.com/blu3ming/readyOS/main/functions_for_zshrc >> ~/.bashrc
echo -e "\n[*] Funciones instaladas"
echo "[*] Recuerda reiniciar la consola para poder usarlas..."
sleep 5
echo "[*] Borrando diccionarios duplicados..."
sleep 5
rm -r /usr/share/wordlists/dirb
echo -e "\n[*] Extrayendo rockyou.txt..."
sleep 5
gzip -d /usr/share/wordlists/rockyou.txt.gz
echo -e "\n[*] Descargando diccionarios de SecLists..."
sleep 5
cd /usr/share/wordlists/
git clone https://github.com/danielmiessler/SecLists
echo -e "\n[*] Descargando scripts útiles (Nishang, PowerUp...)"
sleep 5
cd /opt
git clone https://github.com/samratashok/nishang
wget https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/master/Privesc/PowerUp.ps1
echo -e "[*] Actualizando DB del sistema con updatedb..."
sleep 5
updatedb
echo -e "[*] Finalizando..."
