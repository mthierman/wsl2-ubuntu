wget https://github.com/PowerShell/PowerShell/releases/download/v7.5.2/powershell_7.5.2-1.deb_amd64.deb
sudo dpkg -i powershell_7.5.2-1.deb_amd64.deb
rm powershell_7.5.2-1.deb_amd64.deb
sudo apt update
sudo apt install -y powershell
