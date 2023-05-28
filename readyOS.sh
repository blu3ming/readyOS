#!/bin/bash

cd
echo -e "\n\033[1m[*] Actualizando el sistema...\033[0m"
sleep 5
apt update -y
apt upgrade -y
echo -e "\n\033[1m[*] Sistema actualizado, instalando Sublime...\033[0m"
sleep 5
echo -e "\n\033[1m[*] Obteniendo llave pública del repo...\033[0m"
echo -e "\n\033[1m[*] Nota: Se hardcodea una clave pública, pero debes verificar que sea la correcta. Para ello, ejecuta los comandos:\033[0m"
echo -e '\nsudo add-apt-repository "deb https://download.sublimetext.com/ apt/stable/'
echo -e 'apt update -y'
echo -e "\n\033[1m[*] Si no hay error, puedes continuar. Si lo hay, toma nota de la clave pública que aparece y modifica este script.\033[0m"
sleep 15
gpg --keyserver keyserver.ubuntu.com --recv F57D4F59BD3DF454 #Añade tu clave pública
gpg --armor --export F57D4F59BD3DF454 | sudo apt-key add - #Añade tu clave pública
apt install apt-transport-https ca-certificates curl software-properties-common -y
sudo add-apt-repository "deb https://download.sublimetext.com/ apt/stable/"
apt update -y
apt install sublime-text -y
echo -e "\n\033[1m[*] Sublime instalado\033[0m"
echo -e "\n\033[1m[*] Instalando OhMyTmux...\033[0m"
sleep 5
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
echo -e "\n\033[1m[*] OhMyTmux instalado\033[0m"
echo -e "\n\033[1m[*] Instalando extractPorts y mkt...\033[0m"
sleep 5
curl -S https://raw.githubusercontent.com/blu3ming/readyOS/main/functions_for_zshrc >> ~/.zshrc
curl -S https://raw.githubusercontent.com/blu3ming/readyOS/main/functions_for_zshrc >> ~/.bashrc
echo -e "\n\033[1m[*] Funciones instaladas\033[0m"
echo -e "\n\033[1m[*] Recuerda reiniciar la consola para poder usarlas...\033[0m"
sleep 5
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
echo -e "\n\033[1m[*] Instalando Xclip...\033[0m"
sleep 5
apt install xclip -y
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
wget -q https://github.com/carlospolop/PEASS-ng/releases/download/20220918/linpeas.sh
wget -q https://github.com/carlospolop/PEASS-ng/releases/download/20220918/winPEASany.exe
wget -q https://github.com/carlospolop/PEASS-ng/releases/download/20220918/winPEASx64.exe
wget -q https://github.com/carlospolop/PEASS-ng/releases/download/20220918/winPEASx64_ofs.exe
wget -q https://github.com/carlospolop/PEASS-ng/releases/download/20220918/winPEASx86.exe
wget -q https://github.com/carlospolop/PEASS-ng/releases/download/20220918/winPEASx86_ofs.exe
echo -e "\n\033[1m[*] Instalando PIP de Python 2 y 3...\033[0m"
sleep 5
apt install python3-pip -y
curl -s https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip.py
python2 get-pip.py
rm get-pip.py
apt-get install build-essential python3-dev python2.7-dev -y
echo -e "\n\033[1m[*] Instalando Kerbrute (AD)...\033[0m"
sleep 5
pip install kerbrute
#Impacket casi siempre viene instalado por defecto, solo descomentar si no se ubica
#echo -e "[*] Instalando IMPACKET..."
#python3 -m pip install impacket
#echo "export PATH=$PATH:/usr/share/doc/python3-impacket/examples" >> ~/.zshrc
echo -e "\n\033[1m[*] Instalando Bloodhound y Neo4j...\033[0m"
sleep 5
apt install bloodhound neo4j -y
echo -e "\n\033[1m[*] Instalando rlwrap...\033[0m"
sleep 5
apt install rlwrap -y
echo -e "\n\033[1m[*] Instalando REMMINA (Virtual Desktop)...\033[0m"
sleep 5
apt-get -y install remmina
echo -e "\n\033[1m[*] Instalando Pwntools de Python...\033[0m"
sleep 5
pip install pwn
echo -e "\n\033[1m[*] Instalando Droopescan (escaner CMS)...\033[0m"
sleep 5
pip install droopescan
echo -e "\n\033[1m[*] Instalando Gobuster...\033[0m"
sleep 5
apt install gobuster -y
echo -e "\n\033[1m[*] Instalando BATCAT y 'aliaseandolo' con CAT...\033[0m"
sleep 5
apt install bat -y
echo "alias cat='/bin/batcat'" >> ~/.zshrc
echo "alias catn='/bin/cat'" >> ~/.zshrc
echo "alias cat='/bin/batcat'" >> ~/.bashrc
echo "alias catn='/bin/cat'" >> ~/.bashrc
echo -e "\n\033[1m[*] Instalando un debugger (EDB y GEF por defecto)...\033[0m"
sleep 5
apt install edb-debugger -y
apt install gdb -y #Inicializa los debugger en el sistema, se sustituye por GEF
#git clone https://github.com/longld/peda.git ~/peda
#echo "source ~/peda/peda.py" >> ~/.gdbinit
wget -O ~/.gdbinit-gef.py -q https://gef.blah.cat/py
echo source ~/.gdbinit-gef.py >> ~/.gdbinit
echo -e "\n\033[1m[*] Instalando Ghidra...\033[0m"
sleep 5
apt install ghidra -y
echo -e "\n\033[1m[*] Instalando Keepass (pentesting de contraseñas)...\033[0m"
sleep 5
apt install keepassx -y
echo -e "\n\033[1m[*] Instalando Redis-Tools (servicio web en algunas máquinas de HTB)...\033[0m"
sleep 5
apt install redis-tools -y
echo -e "\n\033[1m[*] Instalando utilidades de esteganografia (steghide y exiftool)...\033[0m"
sleep 5
apt install steghide -y
apt install libimage-exiftool-perl -y
echo -e "\n\033[1m[*] Instalando Crowbar (Bruteforce de RDP o SSH)...\033[0m"
sleep 5
apt install crowbar -y
echo -e "\n\033[1m[*] Instalando Docker (Docker.io y docker-compose)...\033[0m"
sleep 5
apt install docker.io -y
apt install docker-compose -y
echo -e "\n\033[1m[*] Actualizando DB del sistema con updatedb...\033[0m"
sleep 5
updatedb
echo -e "\n\033[1m[*] Finalizando...\033[0m"
sudo apt autoremove -y
