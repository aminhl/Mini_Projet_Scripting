#!/bin/bash
# installing requirment
if ! command -v yad &>/dev/null; then
    echo "---------- Requirment-------------------"
    echo "*yad Not found"
    echo "installing wait"
    sudo apt install yad
fi

# Main Program
if [ "$1" == "" ]
	then
	echo "sauv_favori: [-h|--help] [-T] [-t] [-n] [-N] [-d] [-m] [-s] chemin.."
elif [ "$1" == "-a" -o "$1" == "-A"   ]
        then
	if [ "$2"  == "" ]
                then
			echo "no arguments"
                	exit
        else
        	if [ -f $2 ] || [ -d $2 ]
        	then 
			echo "-----------------------------------------------------------------"
        		echo "                           L'option -a -A"
       			echo "------------------------------------------------------------------"
       			echo $2 >> favFile
       			echo "ajout au favorit list avec succes"
                 else 
                 	echo "File/Folder Don't Exist"
                 	exit
                 fi
                 exit
        fi
elif [ "$1" == "-c" -o  "$1" == "-C"  ]
        then
	if [ "$2"  == "" ]
		then 
			echo "no arguments"
			exit
        else
        	var=`grep $2 favFile`
        	if [ -n "$var" ]
        	then 
			echo "-----------------------------------------------------------------"
        		echo "                           L'option -c -C"
       			echo "------------------------------------------------------------------"
       			cd $2
			echo "chenged directory"
			exec bash 
       			elif [ -z "$var" ] 
			then
                		echo $var
			echo "Target Is Not A Favorit"
				exit
			fi
fi


elif [ "$1" == "-h"  -o   "$1" == "--help"   ]
        then
        echo "-----------------------------------------------------------------"
        echo "                           L'option -h || --help"
        echo "------------------------------------------------------------------"
	cat help.txt	
elif [ "$1" == "-g" ]
        then
        echo "-----------------------------------------------------------------"
        echo "                           L'option -g"
        echo "------------------------------------------------------------------"
	./yad.sh
elif [ "$1" == "-m" ]
	then
        echo "-----------------------------------------------------------------"
        echo "                           L'option -m"
        echo "------------------------------------------------------------------"
        ./menu.sh
elif [ "$1" == "-v" ]
	then
	echo "-----------------------------------------------------------------"
        echo "                       L'option -v est presente"
        echo "------------------------------------------------------------------"
	cat /proc/version
	cat auteurs
elif [ "$1" == "-f" ]
then
	echo "-----------------------------------------------------------------"
        echo "                       L'option -f est presente"
        echo "------------------------------------------------------------------"
 del=`grep -n $2 favFile`
        rem=`echo $del | cut -d: -f1`
	#echo $rem Test! 
	if [ -z "$del" ];then
        echo "$2 Not A Favori"
        elif [ -n "$del" ];then
	sed -i "$rem"d favFile
 echo " Deleted from favoritlist avec success"
	fi

elif [ "$1" == "-l" ]
then
	echo "-----------------------------------------------------------------"
        echo "                       L'option -l est presente"
        echo "------------------------------------------------------------------"
 cat favFile	

elif [ "$1" == "-r" ]
then
	echo "-----------------------------------------------------------------"
        echo "                       L'option -r est presente"
        echo "------------------------------------------------------------------"
del=`grep -n $2 favFile`
        rem=`echo $del | cut -d: -f1`
	#echo $rem Test! 
	if [ -z "$del" ];then
        echo "$2 Not A Favori"
        elif [ -n "$del" ];then
	sed -i "$rem"d favFile
	fi

elif [ "$1" == "-s" ]
then
	echo "-----------------------------------------------------------------"
        echo "                       L'option -s est presente"
        echo "------------------------------------------------------------------"
        
w=`identify -format '%w' $2`
h=`identify -format '%h' $2`

while [ $w -gt "700" ] || [ $h -gt "700" ]
do
        if [ $w -gt "700" ];then
        echo "w:"
        read w
        elif [ $h -gt "700" ];then
        echo "h:"
        read h
        fi
done
        resize="$w"x"$h"
        convert $2 -resize $resize! $2
        mv $2 "/home/cicada3301/Project/favoris_images"
elif [ "$1" == "-n" ]
then
	echo "-----------------------------------------------------------------"
        echo "                       L'option -n est presente"
        echo "------------------------------------------------------------------"
cur=`stat -c %y $2 |cut -d " " -f 1`
	cre=`stat -c %y $2 |cut -d "." -f 1 | cut -d " " -f 2`
	rmex=`basename -s .jpg $2`
	mv $2 "/home/cicada3301/Project/favoris_images/$rmex"_"$cur"_"$cre".jpg    
   	
fi

 #sudo apt-get install imagemagick
