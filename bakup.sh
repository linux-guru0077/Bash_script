#!/bin/bash

# Ask user for target URL
read -p "Enter the target URL (e.g., https://example.com): " TARGET

# Custom wordlist
cat <<EOF > temp-wordlist.txt
index.php.bak
index.php.old
config.php.bak
config.php~
admin.bak
admin.old
debug.php
test.php
dev-login.php
backup.zip
backup.tar.gz
site-backup.tar.gz
database.sql
db.sql
.phpinfo
.git/config
.git
tmp
.tmp
EOF

echo "[*] Starting hidden and backup file enumeration on $TARGET ..."
ffuf -u $TARGET/FUZZ -w temp-wordlist.txt -mc all

# Clean up
rm temp-wordlist.txt
