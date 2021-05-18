
#!/bin/sh
add(){
   path=$1 
yad \
--title "addfavoirs" \
--button="Retour":2 \
--text="`echo $path >> favFile`"
./aminhl.sh -g 
}
INPUTTEXT=`yad --title="path" --width=250 --entry --entry-label="path" --entry-text="ecrire ici..."`
 	add $INPUTTEXT
exit

