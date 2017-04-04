#!/bin/bash

for i in *; do
	if [ -d $i ] ; then
		cd $i
		git config user.name "$(cat .referente | head -1)"
		if tail -1 .referente|grep '@'; then
			git config user.email "$(tail -1 .referente|grep '@')"
		fi
		git add .
		git commit -m "Aggiornamento $i"
		cd ..
	fi
done

git config --global user.name "Marco Marinello"
git config --global user.email "marco.marinello@fuss.bz.it"
