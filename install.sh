#!/bin/bash

# Get the directory of this script. Thaks to:
# http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

echo -e "This script will overwrite a bunch of yours old dotfiles.\n" \
	"Are you subre about that [y/N]?"
read opt
if [ "$opt" != "y" ] && [ "$opt" != "Y" ]
then
	echo "Good. Exiting."
	exit 0
fi

function copyfile() {
	echo "Copying file '$1' to '$2'"
	cp "$1" "$2"
}

function copydir() {
	if [ -e "$2" ]
	then
		echo "Removing old '$2'"
		rm -r "$2"
	fi
	echo "Copying dir '$1' to '$2'"
	cp -R "$1" "$2"
}

# Install zsh files.
mkdir -p $HOME/.zsh
copyfile ${DIR}/zsh/zprofile		~/.zprofile
copyfile ${DIR}/zsh/zshrc		~/.zshrc
copydir  ${DIR}/zsh/functions		~/.zsh/

# Instal bash files.
copyfile ${DIR}/bash/bashrc		~/.bashrc
copyfile ${DIR}/bash/bash_aliases	~/.bash_aliases
copyfile ${DIR}/bash/bash_colors	~/.bash_colors
copyfile ${DIR}/bash/bash_profile	~/.bash_profile

# Install git files.
copyfile ${DIR}/git/git-completion.bash	~/.git-completion.bash
copyfile ${DIR}/git/gitconfig		~/.gitconfig
copyfile ${DIR}/git/git-prompt.sh	~/.git-prompt.sh

# Install screen files.
copyfile ${DIR}/screenrc		~/.screenrc

# Install tmux files.
copyfile ${DIR}/tmux.conf		~/.tmux.conf

# Install vim files.
copydir  ${DIR}/vim			~/.vim
copyfile ${DIR}/vimrc			~/.vimrc

# Install octave files.
copyfile ${DIR}/octaverc		~/.octaverc

# xorg files.
copyfile ${DIR}/xinitrc			~/.xinitrc

# Install minicom files, if minicom is installed.
if [ -x $(which minicom) ]
then
	destf="/etc/minirc.$USER"
	echo "[sudo required]: to install minicom files in $destf"
	sudo cp ${DIR}/minicom/minirc.user "$destf"
fi

# Install diffmeld (or diffk, or diffbc, you have to choose).
# Note you depend meld (or kdiff3, or bcompare) installed.
destf="/usr/local/bin/diffmeld"
echo "[sudo required]: to install diffmeld in $destf"
sudo cp ${DIR}/git/diffmeld "$destf"

