#!/bin/bash

while true
do
echo "===== NET4U CD MENU ====="
echo "1) Pull image from DockerHub"
echo "2) Run X Containers"
echo "3) Remove image or container"
echo "4) Stop container"
echo "5) Exit"

read -p "Choose an option: " choice

case $choice in

1)
echo -e "choose image to install:\n(centos/php/amiram6/net4u_nginx)"
read OS

if [[ $OS == "centos" || $OS == "php" || $OS == "amiram6/net4u_nginx" ]]
then
    sudo docker pull $OS
else
    echo "choose a valid option"
fi
;;

2)
read -p "How many containers to run? " num
for ((i=1;i<=num;i++))
do
    sudo docker run -d -p 808$i:80 amiram6/net4u_nginx
done
;;

3)
read -p "Enter image or container name to remove: " name
sudo docker rm -f $name 2>/dev/null
sudo docker rmi $name 2>/dev/null
;;

4)
read -p "Enter container name to stop: " cname
sudo docker stop $cname
;;

5)
echo "Exiting..."
break
;;

*)
echo "Invalid option"
;;

esac

done
