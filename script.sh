#!/bin/bash

# List of all directories inside ./remote (change the path as needed)
list=$(find ./smbshare -type d) ### change directory.

for i in $list
do
    # Try to create a file in the directory to test writability
    touch "$i/t00n" 2>/dev/null

    # Check if the previous command (touch) was successful
    if [ $? -eq 0 ] ### 0 is the standard return code for a successful completion, 1 is the opposite.
    then
        # If successful (writable), print a message
        tput setaf 6; echo "[+] This Directory Is Writable!:"
        echo "$i"

        # Remove the test file created
        rm "$i/t00n"
    else
        # If not writable, print a different message
        tput setaf 1; echo "[-] This Directory Is Not Writable:"
        echo "$i"
    fi
done
