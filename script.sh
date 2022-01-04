#!/bin/bash

list=$(find ./remote -type d)    ### change directory.
for i in  $list
do
        $(touch $i/t00n 2>/dev/null)
        if [ $? -eq 0 ]   ### 0 is the standard return code for a successful completion, 1 is the opposite.
        then
                tput setaf 6; echo "[+] This Directory Is Writable!:";
                echo $i

        fi
done
