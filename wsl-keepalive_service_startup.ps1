sudo systemctl daemon-reload
sudo systemctl enable wsl-keepalive.service
sudo systemctl start wsl-keepalive.service

# check if running
systemctl status wsl-keepalive.service
