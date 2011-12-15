#!/bin/bash
# This function converts aliases in ~/.bashrc to aliases in ~/.bash_alias.d/
# The first parameter might be an alternative directory to use, given without
# trailing slash

function convert_rc_alias()
{
	if [ -z $1 ]
	then
		WORKDIR="~"
	else
		if [ -d "$1" ]
		then
			echo "Using $1 as working directory"
			WORKDIR="$1"
		else
			echo "Directory $1 not found, aborting.."
			exit 1
		fi
	fi

	IFS_BACKUP="$IFS"
	IFS=$'\n'

	for alias in $(cat ${WORKDIR}/.bashrc | grep -E '^alias')
	do
		# grep out the name for the alias for use as filename
		fname=$(echo "$alias" | grep -E '^alias' | awk '{print $2};' | grep -Eoi '^([a-zA-Z0-9_-]*)' 2>/dev/null)

		# We won't override existing files
		if [ ! -f ${WORKDIR}/.bash_alias.d/${fname}.alias ]
		then
			echo "Converting alias $fname"

			echo "#!/bin/false" > ${WORKDIR}/.bash_alias.d/${fname}.alias
			echo "$alias" >> ${WORKDIR}/.bash_alias.d/${fname}.alias

			# Delete line from bashrc
			linenum=$(cat ${WORKDIR}/.bashrc | grep -n "$alias")
			linenum=${linenum%%:*}
			sed -i".bak_sed_remove" "${linenum}d" ${WORKDIR}/.bashrc
			if [ -f ".bashrc.bak_sed_remove" ]
			then
				rm ".bashrc.bak_sed_remove"
			fi
		else
			echo "Alias file '$fname'.alias already exists. Skipping that one.."
		fi
	done

	IFS="$IFS_BACKUP"
}