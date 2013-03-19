#!/bin/bash

# export servers IPs
export GOBO_SERVER=192.168.50.12

# alias for busybox utilities in Ensitec
alias gtftp='busybox tftp $@ $GOBO_SERVER'

# gobo server
alias gobo='ssh diogo@$GOBO_SERVER'

# usb-serial
alias serial='screen /dev/ttyUSB0 115200'

# some more ls aliases
alias ll='ls -lF'
alias la='ls -A'
alias l='ls -lh'

# dc aliases
alias cd..='cd ..'
alias cd...='cd..;cd..'
alias cd....='cd...;cd..'
alias cd.....='cd....;cd..'
alias cd.......='cd.....cd;cd..'

# vim aliases
alias vi='vim'

# system notify aliases
alias alert_helper='history|tail -n1|sed -e "s/^\s*[0-9]\+\s*//" -e "s/;\s*alert$//"'
alias alert='notify-send -i /usr/share/icons/oxygen/32x32/status/task-complete.png "[$?] $(alert_helper)"'

git config --global diff.external diff_meld.sh
