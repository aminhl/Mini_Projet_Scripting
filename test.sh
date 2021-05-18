#!/bin/bash

FavorisFile=favFile
HelpFile=hFile
cv=aminhl.sh

show_usage(){
	echo "sauv_favori: [-h|--help] [-T] [-t] [-n] [-N] [-d] [-m] [-s] chemin.."
	return 1
}

HELP(){
	cat $HelpFile
}

add_favori(){
	if [ -f $1 ] || [ -d $1 ];then
	echo $1 >> $FavorisFile
	else 
		echo "File/Folder Don't Exist"
	fi
}

delete_favori(){
        del=`grep -n $1 favFile`
        rem=`echo $del | cut -d: -f1`
	#echo $rem Test! 
	if [ -z "$del" ];then
        echo "$1 Not A Favori"
        elif [ -n "$del" ];then
	sed -i "$rem"d favFile
	fi
}

change(){
	var=`grep $1 favFile`
	if [ -n "$var" ];then
	cd $1
	exec bash 
	elif [ -z "$var" ];then
	echo $var
	echo "Target Is Not A Favorit"
	fi
}

menu_text(){

PS3="Votre choix :"

select item in "- Ajouter -" "- Author -" "- Exit -"

do

echo "Vous avez choisi l'item $REPLY : $item"

case $REPLY in

1) add_favori $OPTARG

;;

2) display_fav

;;

3) exit 0

;;

*)

echo "Choix incorrect"

;;

esac

done

}

display_fav(){
	echo "La Liste Des Favoris:"
	cat favFile
}

save_img(){

w=`identify -format '%w' $1`
h=`identify -format '%h' $1`

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
        convert $1 -resize $resize! $1
        mv $1 "/home/cicada3301/Project/favoris_images"
}


show_author_version(){
	echo "Author:"
	ls -al $cv | awk '{print $3}'
	ver=`grep VERSION= /etc/os-release`
	echo $ver
}

rename_img(){
	cur=`stat -c %y $1 |cut -d " " -f 1`
	cre=`stat -c %y $1 |cut -d "." -f 1 | cut -d " " -f 2`
	rmex=`basename -s .jpg $1`
	mv $1 "/home/cicada3301/Project/favoris_images/$rmex"_"$cur"_"$cre".jpg

}

if [ $# -eq "0" ];then
	show_usage
fi

while getopts "a:c:hlms:vr:n:" option
do
	case $option in
	a)	add_favori $OPTARG
			;;
	c)	change $OPTARG 
			;;
	h)      HELP
			;;
	l)	display_fav
			;;
	m)	menu_text
			;;
	s)	save_img $OPTARG
			;;
	v) 	show_author_version
			;;
	r)	delete_favori $OPTARG
			;;
	n)	rename_img $OPTARG
			;;
	esac
done
