#!/bin/bash

# NAME:         pdflinkextractor
# AUTHOR:       Glutanimate (http://askubuntu.com/users/81372/), 2013
# LICENSE:      GNU GPL v2
# DEPENDENCIES: wget lynx
# DESCRIPTION:  extracts PDF links from websites and dumps them to the stdout and as a textfile
#               only works for links pointing to files with the ".pdf" extension
#
# USAGE:        pdflinkextractor "www.crackca.com/2015/07/ca-ipcc-podcasts-free-download-all.html"

WEBSITE="$1"

echo "Getting link list..."

lynx -cache=0 -dump -listonly "$WEBSITE" | grep ".*\.zip$" | awk '{print $2}' | tee pdflinks.txt

# OPTIONAL
#
# DOWNLOAD PDF FILES
#
#echo "Downloading..."    
#wget -P pdflinkextractor_files/ -i pdflinks.txt
