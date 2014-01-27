#!/bin/bash

for folder in $(find vimfiles/bundle -mindepth 1 -maxdepth 1 -type d); do
	echo $folder
	(cd $folder && git checkout master && git pull)
done

for submodule in $(git status | grep modified | sed 's/.*\(vimfiles\/bundle\/[A-Za-z]*\) .*/\1/'); do
	echo $submodule
	submodulename=${submodule##*/}
	echo $submodulename
	git add $submodule
	git commit -sm "plugin : updated $submodulename"
done
