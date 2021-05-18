rename(){
yad \
--title "Save image" \
--button="Retour":3 \
--text="chage"
./aminhl.sh -g 
}
img=`yad --title="image" --width=250 --entry --entry-label="path" --entry-text="ecrire ici..."`

#echo $img


 cur=`stat -c %y $img |cut -d " " -f 1`
 	cre=`stat -c %y $img |cut -d "." -f 1 | cut -d " " -f 2`
 	rmex=`basename -s .jpg $img`
 	mv $img "/home/cicada3301/Project/favoris_images/$rmex"_"$cur"_"$cre".jpg 
