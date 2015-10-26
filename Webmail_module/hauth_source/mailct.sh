#!/bin/sh

find . -name "cur" -print |
while read A
do
echo "$A" >>mailct.log
ls $A | wc -l >>mailct.log

done
