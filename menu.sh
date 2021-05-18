#!/bin/bash
# Menu Textuel
echo "-----------------------------Menu Textuel-------------------------"
echo "* Option:"
echo "* [-a] : Ajoute le chemin dans votre liste de favoris"
echo "* [-c] : Change le répertoire de travail"
echo "* [-r] : Supprimer un favori de la liste"
echo "* [-l] : Afficher la liste de tous les favoris"
echo "* [-h] : Afficher le help"
echo "* [-g] : Menu graphique"
echo "* [-s] : Sauvegarder des images"
echo "* [-n] : Renommer les images en ce format NOM_DATE_HEURE.jpg"
echo "* [-q] : Quitter"


while true
do
    read -p '>> ' u
    if  [  "$u"  == "-q"  ]
    	then
         exit
         exit
    fi
    if [ "$u" != "" ]
    then
    ./aminhl.sh $u
    fi
done

