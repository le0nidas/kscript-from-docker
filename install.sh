#!/bin/bash

echo "Building image for kscript..."
docker build -t kscript:latest .
echo ""

echo "Add execute mode to bin/kscript-router.sh"
chmod +x bin/kscript-router.sh
echo ""

echo "Trying to add kscript router to PATH..."
if [[ -e $HOME/.bashrc ]]; then
	if ! grep -q "# kscript" "$HOME/.bashrc"; then
		echo "" >> "$HOME/.bashrc"
		echo "# kscript" >> "$HOME/.bashrc"
		echo "export PATH=$(pwd)/bin:$PATH" >> "$HOME/.bashrc"
	
		source $HOME/.bashrc

		echo "Added to $HOME/.bashrc!"
	fi
else
	echo "Could not find $HOME/.bashrc"
	echo "Aborting..."
	exit -1
fi
echo ""


echo "Trying to add alias for kscript..."

alias_file="$HOME/.bashrc"
if [[ -e $HOME/.bash_aliases ]]; then
	alias_file="$HOME/.bash_aliases"
fi

if ! grep -q "# kscript" "$alias_file"; then
	echo "" >> $alias_file
	echo "# kscript" >> $alias_file
	echo "alias kscript=kscript-router.sh" >> $alias_file

	source $alias_file

	echo "Added!"
fi
