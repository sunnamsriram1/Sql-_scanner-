#!/data/data/com.termux/files/usr/bin/bash

# 🔧 Auto Installer/Updater for sqlmap
# 🔐 Coded by Sriram

echo -e "\n\033[1;36m⚙️  SQLMap Installer / Updater — by Sriram\033[0m"

if [[ -d sqlmap ]]; then
    echo -e "\033[1;34m[~] sqlmap already exists. Updating...\033[0m"
    cd sqlmap && git pull && cd ..
else
    echo -e "\033[1;32m[+] Installing sqlmap...\033[0m"
    git clone --depth=1 https://github.com/sqlmapproject/sqlmap.git
fi

echo -e "\n\033[1;32m[✓] sqlmap is ready. You can now run:\033[0m"
echo -e "\033[1;33m    bash Sqlsimpl.sh\033[0m"
