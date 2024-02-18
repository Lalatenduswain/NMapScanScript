#!/bin/bash

# Prerequisite Applist
#sudo apt install nmap
#sudo apt-get install xsltproc
#sudo apt install xmlstarlet



# Function to execute commands for a single IP
execute_commands() {
    ip=$1
    echo "Scanning IP: $ip"
    
    # Create NMapScanReport folder if not exists
    report_folder="$HOME/NMapScanReport"
    mkdir -p "$report_folder"
    
    # Command 1
    nmap "$ip" -Pn -sV -oX "$report_folder/$ip.xml"
    
    # Command 2
    xsltproc -o "$report_folder/$ip.csv" /usr/share/nmap/nmap.xsl "$report_folder/$ip.xml"
    
    # Command 3
    xmlstarlet sel -t -m "//host/ports/port" -v "concat(@portid,',',@protocol,',',state/@state,',',service/@name,',',service/@product,',',service/@version)" -n "$report_folder/$ip.xml" > "$report_folder/$ip.csv"
}

# Check if user is root, if not, prompt for password and rerun script with sudo
if [ "$(id -u)" -ne 0 ]; then
    echo "This script requires root permissions to run."
    sudo "$0" "$@"
    exit $?
fi

# Prompt user for input method
read -p "Do you want to scan a single IP (1) or a file with multiple IPs (2)? " choice

case $choice in
    1)
        # Prompt user for single IP address
        read -p "Enter the IP address to scan: " ip_address
        execute_commands "$ip_address"
        ;;
    2)
        # Prompt user for file containing multiple IPs
        read -p "Enter the path to the file containing IP addresses: " ip_file
        if [ ! -f "$ip_file" ]; then
            echo "File not found: $ip_file"
            exit 1
        fi
        
        # Loop through each IP address in the file
        while IFS= read -r ip_address; do
            execute_commands "$ip_address"
        done < "$ip_file"
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac

echo "Scan completed. Reports saved in $HOME/NMapScanReport folder."
