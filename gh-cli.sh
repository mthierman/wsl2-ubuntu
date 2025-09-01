# (type -p wget >/dev/null || (sudo apt update && sudo apt install wget -y)) \
# 	&& sudo mkdir -p -m 755 /etc/apt/keyrings \
# 	&& out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
# 	&& cat $out | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
# 	&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
# 	&& sudo mkdir -p -m 755 /etc/apt/sources.list.d \
# 	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
# 	&& sudo apt update \
# 	&& sudo apt install gh -y

wget https://github.com/cli/cli/releases/download/v2.78.0/gh_2.78.0_linux_amd64.deb
sudo dpkg -i gh_2.78.0_linux_amd64.deb
rm gh_2.78.0_linux_amd64.deb
sudo apt update
sudo apt install -y gh
