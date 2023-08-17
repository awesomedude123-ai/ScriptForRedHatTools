#!/bin/usr/env bash


echo "Below is a list of the software going to be downloaded."

##List of softwares that can be installed. If a new software is added to the script, please also add it here so that the 
declare -a software_installed=(
    [0]="Git"
    [1]="Python3"
    [2]="Pip" 
    [3]="PowerShell"
    [4]="Nmap"
    [5]="Sqlmap"
    [6]="Nikto"
    [7]="OpenVAS"
    [8]="SET"
    [9]="Metasploit"
    [10]="Invoke-Obfuscation"
    [11]="Hashcat"
    [12]="BeEF"
    [13]="PowerUp"
    [14]="BeRoot"
    [15]="PAExec"
    [16]="LaZagne"
    [17]="EvilURL"
    [18]="Pupy"
    [19]="DNSCAT2"
    [20]="Cloakify Factory"
    [21]="DNSExfiltrator"
    )
x=0
for i in ${software_installed[@]}; do
    echo "$x: $i"
    x+=1
done

echo "Setting up Environment. Please take a look at the list of softwares."
wait 10

cd ~
##Updating Apt-Get
sudo apt-get update

##Downloading Git
echo "Installing Git............."
sudo apt-get install git-all

##Downloading Python
echo "Installing python3.............."
sudo apt install python3

##Downloading Pip
echo "Installing pip.............."
sudo apt install python3-pip

##Downloading Powershell
echo "Installing Powershell............."
sudo apt-get install -y wget apt-transport-https software-properties-common
wget -q "https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb"
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
sudo apt-get update
sudo apt-get install -y powershell
sudo snap install powershell

##Downloading Nmap
echo "Installing nmap..............."
sudo apt-get install nmap

##Downloading Sqlmap
echo "Installing sqlmap.............."
sudo apt-get install sqlmap

##Downloading Nikto
echo "Installing Nikto................."
sudo apt install nikto -y
sudo apt install apache2 -y

##Downloading OpenVAS
echo "Installing OpenVAS................."
sudo apt install wget apt-transport-https gnupg2 software-properties-common
sudo apt install sqlite3
sudo add-apt-repository ppa:mrazavi/openvas
sudo apt install openvas

##Downloading SET
echo "Installing SET................."
git clone https://github.com/trustedsec/social-engineer-toolkit/ setoolkit/
cd setoolkit
pip3 install -r requirements.txt
sudo python setup.py
cd ~

##Downloading Metasploit
echo "Installing Metasploit................."
wget http://downloads.metasploit.com/data/releases/metasploit-latest-linux-x64-installer.run
chmod +x ./metasploit-latest-linux-x64-installer.run
sudo ./metasploit-latest-linux-x64-installer.run

##Downloading Invoke-Obfuscation
echo "Installing Inoke-Obfuscation............."
git clone https://github.com/danielbohannon/Invoke-Obfuscation.git

##Downloading Hashcat
echo "Installing Hashcat............."
sudo apt install hashcat

##Downloading BeEF
echo "Installing BeEF.............."
sudo apt-add-repository -y ppa:brightbox/ruby-ng
sudo gem install bundler
git clone https://github.com/beefproject/beef
cd beef
./install
cd ~

##Downloading PowerUp
echo "Installing PowerUp............."
git clone https://github.com/ibm/power-up
cd power-up
sudo ./scripts/install.sh
cd ~

##Downloading BeRoot
echo "Installing BeRoot.............."
git clone https://github.com/AlessandroZ/BeRoot.git

##Downloading PAExec
echo "Installing PAExec........"
sudo apt-get update -y
sudo apt-get install -y paexec

##Downloading LaZagne
echo "Installing LaZagne............."
git clone https://github.com/AlessandroZ/LaZagne.git
cd LaZagne
pip install -r requirements.txt
cd ~

##Downloading EvilURL
echo "Installing EvilURL..........."
git clone https://github.com/UndeadSec/EvilURL.git
cd EvilURL
pip install python-nmap python-whois
cd ~

##Downloading Pupy
echo "Installing Pupy..............."
Pupy Download
git clone https://github.com/n1nj4sec/pupy
cd pupy
git submodule init
git submodule update
pip install -r pupy/requirements.txt
cd ~

##Downloading DNSCAT2
echo "Installing DNSCAT2.............."
git clone https://github.com/iagox86/dnscat2.git

##Downloading Cloakify Factory
echo "Installing Cloakify Factory............."
git clone https://github.com/TryCatchHCF/Cloakify.git

##Downloading DNSExfiltrator
echo "Installing DNSExfiltrator..............."
sudo apt-get dist-upgrade
sudo apt-get install bind9
sudo apt-get install dnsutils

echo "If there is any other software that needs to be installed, you can add it to this script and add it to the list of software going to be installed."