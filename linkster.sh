#!/bin/bash

echo "
  _ _       _        _            
 | (_)     | |      | |           
 | |_ _ __ | | _____| |_ ___ _ __ 
 | | | '_ \| |/ / __| __/ _ | '__|
 | | | | | |   <\__ | ||  __| |   
 |_|_|_| |_|_|\_|___/\__\___|_|   
                                  
 simple utility to list links from a given URL
 author: Ray Santillan
 Usage: ./linkster.sh www.yourawesomesite.com    

"
# remove previous index.html file
$(rm -rf index.html)

echo "Downloading page of $1"

# downdload the page
$(wget $1)

cmd=$(grep "href=" index.html | awk -F "https://|http://" '{ print $2 }' | cut -d "\"" -f 1 | awk -F "'|/>" '{ print $1 }
' | sort -u >> link.ster)

echo -e "Links saved to link.ster!\n\n"
echo -e "Links found: \n\n"

for link in $(cat link.ster); do echo $link; done