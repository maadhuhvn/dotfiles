#!/usr/bin/env bash

# Function to delete existing IP tables rules
delete_rules() {
    result=$(sudo iptables -S | grep "block jb")
    if [[ ! -z $result ]]; then
        echo "Found old iptables rules:"
        while IFS= read -r line; do
            echo "  Rule: $line"
            ip=$(echo $line | awk '{print $4}')
            echo "  IP to delete: $ip"
            sudo iptables -D INPUT -s $ip -m comment --comment "block jb" -j DROP
            echo "  Deleted old iptables rule for IP: $ip"
        done <<<"$result"
    else
        echo "No existing rules found."
    fi
}

# Function to add new IP tables rules
add_rules() {
    echo "------------"
    ipaddresses=$(nslookup account.jetbrains.com | grep Address: | awk '!/127\./{ print $2 }')

    # Check if nslookup returned any IP addresses
    if [[ -z "$ipaddresses" ]]; then
        echo "No IP addresses found for account.jetbrains.com"
        exit 1
    fi

    # Create an array of IP addresses
    temp=()
    while IFS= read -r ip; do
        temp+=("$ip")
    done <<<"$ipaddresses"

    # Add new IP tables rules
    for ip in "${temp[@]}"; do
        echo "IP to add: $ip"
        sudo iptables -A INPUT -s $ip -j DROP -m comment --comment "block jb"
        echo "  Added new iptables rule for IP: $ip"
    done
}

# Check if the --delete parameter is passed
if [[ "$1" == "--delete" ]]; then
    delete_rules
else
    delete_rules
    add_rules
fi

echo "All good"
