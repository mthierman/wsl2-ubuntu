wget https://github.com/PowerShell/PowerShell/releases/download/v7.6.1/powershell_7.6.1-1.deb_amd64.deb
sudo dpkg -i powershell_7.6.1-1.deb_amd64.deb
rm powershell_7.6.1-1.deb_amd64.deb
sudo apt update
sudo apt install -y powershell
