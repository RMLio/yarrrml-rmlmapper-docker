#!/bin/sh

args="$@"
echo "$args"
if [ $# -lt 1 ]
then
	echo 'Arguments: <yarrrml input file> [RML mapper arguments...]'
	exit 1
fi

rulesfile=$1
shift

cd /home/rmluser/data
/home/rmluser/node_modules/@rmlio/yarrrml-parser/bin/parser.js -i $rulesfile -o /tmp/$rulesfile.ttl
java -jar ../rmlmapper.jar --mappingfile /tmp/$rulesfile.ttl $@
