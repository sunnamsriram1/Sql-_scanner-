#!/data/data/com.termux/files/usr/bin/bash

# 🔍 Auto SQLMap Crawler Script + URL Extractor Saver
clear
echo -e "\033[1;36m🛡️ Simple SQLMap Auto-Crawler Script — Coded by Sriram"
echo -e "\033[1;33mEnter target URL (example: http://site.com): \033[0m"
read target

if [[ -z "$target" ]]; then
    echo -e "\033[1;31m[✘] No URL entered! Exiting..."
    exit 1
fi

outfile="crawled_urls.txt"
tmpfile="tmp_sqlmap_output.txt"

echo -e "\033[1;32m[✓] Crawling: $target with sqlmap (local folder) --crawl=2 --batch\n"
python3 sqlmap/sqlmap.py -u "$target" --crawl=2 --batch > "$tmpfile"

grep -oE 'http[s]?://[^ ]+\?(id|nid|page|cat|newsid|pid)=[^ ]+' "$tmpfile" | sort -u >> "$outfile"

echo -e "\n\033[1;36m[✓] Extracted URLs saved to: $outfile\033[0m"
rm "$tmpfile"
