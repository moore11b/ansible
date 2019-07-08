#! /bin/bash
for i in $1
do
passwd  --stdin $i <<<$2
done
