#!/data/data/com.termux/files/usr/bin/bash

# 🛠️ Auto Installer for SQLMap + Custom Scripts (By Sriram)
# ✅ This script installs sqlmap from GitHub and copies custom scripts into it.

# 🎨 Colors
GREEN="\033[1;32m"
RED="\033[1;31m"
YELLOW="\033[1;33m"
RESET="\033[0m"

echo -e "${YELLOW}🔄 Installing/Updating SQLMap...${RESET}"

# Step 1: Clone sqlmap if not exists
if [ ! -d "sqlmap" ]; then
    git clone --depth=1 https://github.com/sqlmapproject/sqlmap.git
    echo -e "${GREEN}[✓] SQLMap cloned successfully.${RESET}"
else
    echo -e "${YELLOW}[~] SQLMap already exists. Pulling latest changes...${RESET}"
    cd sqlmap && git pull && cd ..
fi

# Step 2: Move custom scripts into sqlmap folder
echo -e "${YELLOW}📁 Copying custom files to sqlmap directory...${RESET}"

cp Sqlsimpl.sh sqlmap/

echo -e "${GREEN}[✓] Files copied successfully to sqlmap directory.${RESET}"

# Step 3: Give permissions
chmod +x sqlmap/Sqlsimpl.sh
bash Sqlsimpl.sh

echo -e "${GREEN}✅ Installation completed. Run using:${RESET}"
echo -e "${YELLOW}    cd sqlmap && bash Sql.sh${RESET}"
