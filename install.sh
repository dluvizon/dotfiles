#!/bin/bash

dir=~/dotfiles
backupdir=~/dotfiles/backup
files=`ls $dir`
mkdir -p $backupdir

pushd $dir
	for file in $files; do
		mv ~/.$file $backupdir
		ln -s $dir/$file ~/.$file
	done
popd
