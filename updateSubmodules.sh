#!/bin/bash

for folder in $(find vimfiles/bundle -mindepth 1 -maxdepth 1 -type d); do
    echo $folder
    (cd $folder && git checkout master && git pull)
done

IFS=$'\n'
for submodule in $(git status | grep modified | grep -i 'vimfiles/bundle' | sed 's/.*\(vimfiles\/bundle\/[_A-Za-z0-9-]*\) .*/\1/'); do
    echo $submodule
    submodulename=${submodule##*/}
    echo $submodulename
    git add $submodule
    git commit -sm "plugin : updated $submodulename"
done
