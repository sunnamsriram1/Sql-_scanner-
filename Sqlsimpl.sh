#!/data/data/com.termux/files/usr/bin/bash
clear
echo -e "\033[1;36m🛡️ Simple SQLMap Auto-Crawler Script — Coded by Sriram"
echo -e "\033[1;33mEnter target URL (example: http://site.com): \033[0m"
read target

if [[ -z "$target" ]]; then
    echo -e "\033[1;31m[✘] No URL entered! Exiting..."
    exit 1
fi

# Output files
outfile="crawled_urls.txt"
tmpfile="tmp_sqlmap_output.txt"

echo -e "\033[1;32m[✓] Crawling: $target with sqlmap --crawl=5 --batch\n"
python3 sqlmap.py -u "$target" --crawl=5 --batch --output-dir="output" > "$tmpfile"

# Extract URLs with parameters
grep -oE 'http[s]?://[^ ]+\?(id|nid|page|cat|newsid|pid)=[^ ]+' "$tmpfile" | sort -u >> "$outfile"

# Output result
if [ -s "$outfile" ]; then
    echo -e "\n\033[1;36m[✓] Extracted URLs saved to: $outfile\033[0m"
else
    echo -e "\n\033[1;31m[✘] No parameterized URLs found. Try increasing crawl depth or use a different target.\033[0m"
fi

rm "$tmpfile"
