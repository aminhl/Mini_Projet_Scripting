#!/bin/sh
help()
{

yad --title="help" \
--button="Retour":1 \
--text="`cat help.txt`" \


./aminhl.sh -g

}
help
