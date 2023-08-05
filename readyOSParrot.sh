#!/bin/bash

parrot-upgrade
cd
echo -e "\n\033[1m[*] Instalando OhMyTmux...\033[0m"
sleep 5
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
echo -e "\n\033[1m[*] OhMyTmux instalado\033[0m"
echo -e "\n\033[1m[*] Extrayendo rockyou.txt...\033[0m"
sleep 5
gzip -d /usr/share/wordlists/rockyou.txt.gz
echo -e "\n\033[1m[*] Instalando FFMPEG (conversion multimedia)...\033[0m"
sleep 5
apt install ffmpeg -y
echo -e "\n\033[1m[*] Descargando diccionarios de SecLists...\033[0m"
sleep 5
cd /usr/share/wordlists/
git clone https://github.com/danielmiessler/SecLists
echo -e "\n\033[1m[*] Descargando scripts útiles (Nishang y PowerUp)\033[0m"
sleep 5
cd /opt
git clone https://github.com/samratashok/nishang
wget -q https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/master/Privesc/PowerUp.ps1
echo -e "\n\033[1m[*] Instalando JQ (lectura de JSON en consola)...\033[0m"
sleep 5
apt install jq -y
echo -e "\n\033[1m[*] Instalando PLAY (reproduccion de audio desde consola)...\033[0m"
sleep 5
apt install sox -y
echo -e "\n\033[1m[*] Instalando PEASS en /opt...\033[0m"
echo -e "\n\033[1m[-] Nota: PEASS ya no aloja los binarios en el repo, sino en la seccion de releases. Se recomienda dirigirse a esta sección para descargar la última versión manualmente...\033[0m"
sleep 10
cd /opt
mkdir PEAS
cd /opt/PEAS
wget -q https://github.com/carlospolop/PEASS-ng/releases/download/20230731-452f0c44/linpeas.sh
wget -q https://github.com/carlospolop/PEASS-ng/releases/download/20230731-452f0c44/winPEASany.exe
wget -q https://github.com/carlospolop/PEASS-ng/releases/download/20230731-452f0c44/winPEASx64.exe
wget -q https://github.com/carlospolop/PEASS-ng/releases/download/20230731-452f0c44/winPEASx64_ofs.exe
wget -q https://github.com/carlospolop/PEASS-ng/releases/download/20230731-452f0c44/winPEASx86.exe
wget -q https://github.com/carlospolop/PEASS-ng/releases/download/20230731-452f0c44/winPEASx86_ofs.exe
echo -e "\n\033[1m[*] Instalando PIP de Python 2 y 3...\033[0m"
sleep 5
apt install python2 -y
apt install python3-pip -y
curl -s https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip.py
python2 get-pip.py
pip2 install --upgrade pip
pip2 install --upgrade setuptools wheel
rm get-pip.py
apt-get install build-essential python3-dev python2.7-dev -y
echo -e "\n\033[1m[*] Instalando Kerbrute (AD)...\033[0m"
sleep 5
pip3 install kerbrute
#Impacket casi siempre viene instalado por defecto para python3, solo descomentar si no se ubica
echo -e "\n\033[1m[*] Instalando Bloodhound y Neo4j...\033[0m"
sleep 5
apt install bloodhound neo4j -y
echo -e "\n\033[1m[*] Instalando rlwrap...\033[0m"
sleep 5
apt install rlwrap -y
echo -e "\n\033[1m[*] Instalando Pwntools de Python...\033[0m"
sleep 5
pip3 install pwn
echo -e "\n\033[1m[*] Instalando Droopescan (escaner CMS)...\033[0m"
sleep 5
pip3 install droopescan
echo -e "\n\033[1m[*] Instalando un debugger (EDB y GDB por defecto)...\033[0m"
sleep 5
apt install edb-debugger -y
apt install gdb -y #Inicializa los debugger en el sistema, se sustituye por GEF
#git clone https://github.com/longld/peda.git ~/peda
#echo "source ~/peda/peda.py" >> ~/.gdbinit
wget -O ~/.gdbinit-gef.py -q https://gef.blah.cat/py
echo source ~/.gdbinit-gef.py >> ~/.gdbinit
echo -e "\n\033[1m[*] Instalando Ghidra...\033[0m"
sleep 5
apt install keepassx -y
echo -e "\n\033[1m[*] Instalando utilidades de esteganografia (steghide y exiftool)...\033[0m"
sleep 5
apt install steghide -y
apt install libimage-exiftool-perl -y
echo -e "\n\033[1m[*] Instalando Docker (Docker.io y docker-compose)...\033[0m"
sleep 5
apt install docker.io -y
apt install docker-compose -y
echo -e "\n\033[1m[*] Actualizando DB del sistema con updatedb...\033[0m"
sleep 5
updatedb
echo -e "\n\033[1m[*] Finalizando...\033[0m"
sudo apt autoremove -y