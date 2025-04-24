#!/bin/bash

# ANSI escape codes for styling

RED="\033[31m"
BLINK="\033[5m"
ITALIC="\033[3m"
BOLD="\033[1m"
RESET="\033[0m"
LARGER_FONT="\033[1;35m"  # Adding bold as an indicator for larger text

# Display " Results " with styling

echo -e "${RED}${BLINK}${ITALIC}${LARGER_FONT}Results${RESET}"

# Read CVEs from the file 'any.txt'

cve_file="any.txt"

if [[ ! -f "$cve_file" ]]; then
    echo "File '$cve_file' not found. Please create the file with a list of CVEs."
    exit 1
fi

# Loop through each CVE in the file and use 'locate' to search
while read -r cve; do
    if [[ -n "$cve" ]]; then
        locate "$cve"
    fi
done < "$cve_file" | sort | uniq
