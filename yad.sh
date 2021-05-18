#!/bin/bash

 
yad \
--title "Gestion favoris" \
--image="back.jpg" \
--button=gtk-quit:1 \
--button="-ajoutfavoris":2 \
--button="-deletefavoris":3 \
--button="-change":4 \
--button="-version":5 \
--button="-help":6 \
--button="-saveimg":7 \
--button="-rename":8 \

case $? in
1)exit 0
;;
2)./ajoutfavoris.sh
;;
3)./deletefavoris.sh 
;;
4)./change.sh 
;;
5)./version.sh 
;;
6)./help.sh  
;;
7)./saveimg.sh  
;;
8)./rename.sh  
;;


esac





