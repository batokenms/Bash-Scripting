#!/bin/bash 

if ["$EUID" -ne 0]; then              
   echo " you are not the root"
   exit 
else 
    echo "you are good to proceed"
fi  
# upgrade the packages and update the security patches. 
sudo apt-get update  &> /dev/null
sudo apt-get upgrade -y &> /dev/null 

# Checking whether docker is installed 
if ["$(command -v docker)"] &> /dev/null; then       
   echo "docker is installed and nothing is needed"
else 
   echo "docker is installing ......" 
   sudo apt install docker.io -y &>> trash.txt 
   sudo systemctl start docker &>> trash.tx 
   sudo systemctl enable docker &>> trash.txt 
fi 

if ["$(command -v git)"] &>> trash.txt; then 
   echo "git istalled and nothing else is needed" 
else 
   echo " Git istalling ......." 
   sudo apt install git -y 
fi 

echo "====================This is the end of the script==========================" 
