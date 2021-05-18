
#!/bin/sh
delete(){
   path=$1 
yad \
--title "deletefavoirs" \
--button="Retour":3 \
--text="delete from list"
./aminhl.sh -g 
}

INPUTTEXT=`yad --title="USERNAME" --width=250 --entry --entry-label="USERNAME" --entry-text="ecrire ici..."`
del=`grep -n $INPUTTEXT favFile`
rem=`echo $del | cut -d: -f1`
if [ -n "$del" ]
then  
sed -i "$rem"d favFile
#unlock $INPUTTEXT
fi
exit
