#!/bin/sh
version()
{

yad --title="help" \
--button="Retour":1 \
--text="`cat /proc/version 
		cat auteurs`" \


./aminhl.sh -g

}
version 
