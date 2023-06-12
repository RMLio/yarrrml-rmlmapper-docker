#!/usr/bin/env bash

args="$@"
echo "arguments: $args"
if [ $# -lt 1 ]
then
	echo 'Arguments: <yarrrml input file> [RML mapper arguments...]'
	exit 1
fi

# the rules file has to be the first argument
rulesfile=$1
shift

# see if there's a classpath argument
CLASSPATHSTR=''
POSITIONAL_ARGS=()

while [[ $# -gt 0 ]]
do
	case $1 in
		-classpath|--class-path|-cp)
			CLASSPATHSTR=":$2"
			shift # past argument
			shift # past value
			;;
		*)
			POSITIONAL_ARGS+=("$1") # save positional arg
			if [[ -n $2 ]]
			then
				POSITIONAL_ARGS+=("$2")
				shift # past argument
			fi
			shift # past argument
	esac
done

MAPPERJAR=$(readlink -f /rmlmapper-java-development/target/rmlmapper-*all.jar)

echo "mapper arguments: ${POSITIONAL_ARGS[@]}"
cd /mnt/data
/yarrrml-parser-development/bin/parser.js -i $rulesfile -o /tmp/rmlmappingfile.ttl -p && \
java --class-path $MAPPERJAR${CLASSPATHSTR} be.ugent.rml.cli.Main --mappingfile /tmp/rmlmappingfile.ttl ${POSITIONAL_ARGS[@]}
