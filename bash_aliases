#!/bin/bash

# export servers IPs
export GOBO_SERVER=192.168.50.12

# alias for busybox utilities in Ensitec
alias gtftp='busybox tftp $@ $GOBO_SERVER'
alias gobo='ssh diogo@$GOBO_SERVER'

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

git config --global diff.external diff_meld.sh
