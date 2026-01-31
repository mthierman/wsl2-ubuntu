# If this is an interactive terminal, switch to PowerShell
if [ -t 1 ] && command -v pwsh >/dev/null; then
    exec pwsh -NoLogo
fi
