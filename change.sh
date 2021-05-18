
#!/bin/sh

change(){
yad \
--title "Save image" \
--button="Retour":3 \
--text="chage"
./aminhl.sh -g 
}
INPUTTEXT=`yad --title="path" --width=250 --entry --entry-label="path" --entry-text="ecrire ici..."`
echo $INPUTTEXT
cd $INPUTTEXT
exec bash 
