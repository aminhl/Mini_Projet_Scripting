#!/bin/bash
saveimg(){
   path=$1 
yad \
--title "Save image" \
--button="Retour":3 \
--text="save"
./aminhl.sh -g 
}

f=`yad --title="File" --width=250 --entry --entry-label="file" --entry-text="ecrire ici..."`

w=`identify -format '%w' $f`
h=`identify -format '%h' $f`

while [ $w -gt "700" ] || [ $h -gt "700" ]
do
        if [ $w -gt "700" ];then
        w=`yad --title="width" --width=250 --entry --entry-label="width" --entry-text="ecrire ici..."`
        elif [ $h -gt "700" ];then
        h=`yad --title="Hight" --width=250 --entry --entry-label="hight" --entry-text="ecrire ici..."`
        fi
done

resize="$w"x"$h"
convert $f -resize $resize! $f
mv $f "/home/cicada3301/Project/favoris_images"
