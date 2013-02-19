#!/bin/bash

DIR=`pwd`
BACKUPDIR=$DIR/backup
FILES=`ls $DIR -I *.sh`
mkdir -p $BACKUPDIR

pushd $DIR
	for file in $FILES; do
		if [ -e "$HOME/.$file" ]; then
			mv $HOME/.$file $BACKUPDIR
		fi
		ln -s $DIR/$file $HOME/.$file
	done
popd
