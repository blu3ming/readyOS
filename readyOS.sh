#!/bin/bash

cd
echo -e "\n[*] Actualizando el sistema..."
sleep 5
apt update -y
apt upgrade -y
echo -e "\n[*] Sistema actualizado, instalando Sublime..."
sleep 5
apt install apt-transport-https ca-certificates curl software-properties-common -y
sudo add-apt-repository "deb https://download.sublimetext.com/ apt/stable/"
apt update -y
apt install sublime-text -y
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
echo -e "\n[*] Extrayendo rockyou.txt..."
sleep 5
gzip -d /usr/share/wordlists/rockyou.txt.gz
echo -e "\n[*] Descargando diccionarios de SecLists..."
sleep 5
cd /usr/share/wordlists/
git clone https://github.com/danielmiessler/SecLists
echo -e "\n[*] Descargando scripts útiles (Nishang y PowerUp)"
sleep 5
cd /opt
git clone https://github.com/samratashok/nishang
wget https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/master/Privesc/PowerUp.ps1
echo -e "[*] Instalando Xclip..."
sleep 5
apt install xclip -y
echo -e "[*] Instalando PEASS en /opt..."
echo -e "[-] Nota: PEASS ya no aloja los binarios en el repo, sino en la seccion de releases. Se recomienda dirigirse a esta sección para descargar la última versión manualmente..."
sleep 10
cd /opt
mkdir PEASS
cd !$
wget https://github.com/carlospolop/PEASS-ng/releases/download/20220918/linpeas.sh
wget https://github.com/carlospolop/PEASS-ng/releases/download/20220918/winPEASany.exe
wget https://github.com/carlospolop/PEASS-ng/releases/download/20220918/winPEASx64.exe
wget https://github.com/carlospolop/PEASS-ng/releases/download/20220918/winPEASx64_ofs.exe
wget https://github.com/carlospolop/PEASS-ng/releases/download/20220918/winPEASx86.exe
wget https://github.com/carlospolop/PEASS-ng/releases/download/20220918/winPEASx86_ofs.exe
echo -e "[*] Instalando PIP de Python 2 y 3..."
sleep 5
apt install python3-pip -y
apt install python-pip -y
apt-get install build-essential python3-dev python2.7-dev -y
echo -e "[*] Instalando Kerbrute (AD)..."
sleep 5
cd /
git clone https://github.com/ropnop/kerbrute
cd kerbrute
make
#Impacket casi siempre viene instalado por defecto, solo descomentar si no se ubica
#echo -e "[*] Instalando IMPACKET..."
#python3 -m pip install impacket
#echo "export PATH=$PATH:/usr/share/doc/python3-impacket/examples" >> ~/.zshrc
echo -e "[*] Instalando Bloodhound y Neo4j..."
sleep 5
apt install bloodhound neo4j -y
echo -e "[*] Instalando rlwrap..."
sleep 5
apt install rlwrap -y
echo -e "[*] Instalando REMMINA (Virtual Desktop)..."
sleep 5
apt-get -y install remmina
echo -e "[*] Instalando Pwntools de Python..."
sleep 5
pip install pwn
echo -e "[*] Instalando Gobuster..."
sleep 5
apt install gobuster -y
echo -e "[*] Instalando BATCAT y 'aliaseandolo' con CAT..."
sleep 5
apt install bat -y
alias cat='/bin/batcat' >> ~/.zshrc
alias catn='/bin/cat' >> ~/.zshrc
alias cat='/bin/batcat' >> ~/.bashrc
alias catn='/bin/cat' >> ~/.bashrc
echo -e "[*] Instalando un debugger (GEF por defecto)..."
sleep 5
#apt install edb-debugger
#git clone https://github.com/longld/peda.git ~/peda
#echo "source ~/peda/peda.py" >> ~/.gdbinit
wget -O ~/.gdbinit-gef.py -q https://gef.blah.cat/py
echo source ~/.gdbinit-gef.py >> ~/.gdbinit
echo -e "[*] Instalando Keepass (pentesting de contraseñas)..."
sleep 5
apt install keepassx -y
echo -e "[*] Instalando utilidades de esteganografia (steghide y exiftool)..."
sleep 5
apt install steghide -y
apt install libimage-exiftool-perl -y
echo -e "[*] Instalando Crowbar (Bruteforce de RDP o SSH)..."
sleep 5
apt install crowbar -y
echo -e "[*] Actualizando DB del sistema con updatedb..."
sleep 5
updatedb
echo -e "[*] Finalizando..."
sudo apt autoremove -y
