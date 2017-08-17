#!/bin/bash

rev=$(git rev-parse --short HEAD)

ssh-add
hugo
mkdir -p ../generated
cp -r public/* ../generated/
cd ../generated/
git add .
git commit -m "Update content $rev"
git push origin master
