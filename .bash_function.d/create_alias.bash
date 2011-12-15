#!/bin/bash
# This function creates aliases for bash in ~/.bash_alias.d/
# First and second parameter are alias name and alias command
# The third parameter might be an alternative directory to use, given without
# trailing slash

function create_alias()
{
	if [ -z "$1" ] || [ -z "$2" ]
	then
		echo "Need alias name AND alias command"
	fi

	if [ -z "$3" ]
	then
		WORKDIR="~"
	else
		if [ -d "$3" ]
		then
			echo "Using $3 as working directory"
			WORKDIR="$3"
		else
			echo "Directory $3 not found, aborting.."
			exit 1
		fi
	fi

	fname="$1"
	acomm="$2"
	# We won't override existing files
	if [ ! -f ${WORKDIR}/.bash_alias.d/${fname}.alias ]
	then
		echo "#!/bin/false" > ${WORKDIR}/.bash_alias.d/${fname}.alias
		echo "alias ${fname}=\"$acomm\"" >> ${WORKDIR}/.bash_alias.d/${fname}.alias
	else
		echo "Alias file '$fname'.alias already exists. Skipping that one.."
	fi
}