#!/data/data/com.termux/files/usr/bin/bash

# 🔍 Auto SQLMap Crawler Script + URL Extractor Saver
# 💡 Saves crawled URLs to a file
# 🔐 Coded by Sriram

clear
echo -e "\033[1;36m🛡️ Simple SQLMap Auto-Crawler Script — Coded by Sriram"
echo -e "\033[1;33mEnter target URL (example: http://site.com): \033[0m"
read target

if [[ -z "$target" ]]; then
    echo -e "\033[1;31m[✘] No URL entered! Exiting..."
    exit 1
fi

# 🔁 Check if sqlmap is available
if [[ ! -f sqlmap/sqlmap.py ]]; then
    echo -e "\033[1;31m[✘] sqlmap not found in ./sqlmap directory!"
    echo -e "\033[1;33m[→] Run ./install_update.sh to install sqlmap first.\033[0m"
    exit 1
fi

# 📄 Output files
outfile="crawled_urls.txt"
tmpfile="tmp_sqlmap_output.txt"

echo -e "\n\033[1;32m[✓] Crawling: $target with sqlmap --crawl=2 --batch\n"
python3 sqlmap/sqlmap.py -u "$target" --crawl=2 --batch > "$tmpfile"

# 🔎 Extract URLs with parameters
grep -oE 'http[s]?://[^ ]+\?(id|nid|page|cat|newsid|pid)=[^ ]+' "$tmpfile" | sort -u >> "$outfile"

echo -e "\n\033[1;36m[✓] Extracted URLs saved to: $outfile\033[0m"
rm "$tmpfile"
