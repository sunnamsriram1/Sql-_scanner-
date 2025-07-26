#!/data/data/com.termux/files/usr/bin/bash

echo "🔄 Checking for sqlmap..."

# If not already cloned, then clone it
if [ ! -d "sqlmap" ]; then
    echo "📥 Cloning sqlmap..."
    git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git
else
    echo "✅ sqlmap folder already exists. Pulling latest update..."
    cd sqlmap
    git pull
    cd ..
fi

echo "✅ sqlmap ready to use!"
