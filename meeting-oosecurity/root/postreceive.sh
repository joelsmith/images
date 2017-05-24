#!/usr/bin/bash

newdir=$(mktemp -d /var/www/html.new.XXXXXXXXXXXX)
trap 'rm -rf "$newdir" "$newdir".old' EXIT

git archive master | tar -x -C "$newdir"
mv /var/www/html "$newdir".old
mv "$newdir" /var/www/html 
rm -rf "$newdir".old
