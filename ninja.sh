cd ~
sudo apt install unzip
wget https://github.com/ninja-build/ninja/releases/download/v1.13.1/ninja-linux.zip
unzip ninja-linux.zip -d ninja-linux
rm ninja-linux.zip
cp ninja-linux/ninja .local/bin/ninja
rm -r ninja-linux
