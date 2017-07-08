#!/bin/bash
clear
echo ' _____           _     _            _____ _                     
|  _  |___ ___ _| |___|_|_ _ ___   |     | |___ ___ ___ ___ ___ 
|   __| -_|   | . |  _| | | | -_|  |   --| | -_| . |   | -_|  _|
|__|  |___|_|_|___|_| |_|\_/|___|  |_____|_|___|_, |_|_|___|_|  
                                                                
When the car player skips numbers from the tracks it is because they have files created by iTunes and they are not necessary for the car player.
'

contar ()
{
find /Volumes/* \( -type d -path "*.*" -prune -o -type d -path "*/Library" -prune \) -type f -o -name "._*.mp3" \! -type d | wc -l | sed -e 's/^[ \t]*//'
}

total=$(contar)

if [ $total != 0 ]; then

read -p "$total file(s) found. Do you want to delete them? [y/n]" resp
echo
if [[ $resp = y ]] ; then
find /Volumes/* \( -type d -path "*.*" -prune -o -type d -path "*/Library" -prune \) -type f -o -name "._*.mp3" \! -type d -exec rm -rf {} \;
echo "Tasks completed successfully.
"
fi
else
echo "There are no junk files.
"
fi