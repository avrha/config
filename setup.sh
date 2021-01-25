#!/bin/bash

RED='\033[0;31m'
GREEN='\u001b[32m'
YELLOW='\u001b[33m'
NC='\033[0m' 

echo -e "${RED}-PLEASE NOTE-${NC} Any existing media will be overwritten. Backup is recommended."
echo -e "Install Config? ${GREEN}Y${YELLOW}/${RED}N${NC}"
read input

if [[ $input == Y ]] || [[ $input == y ]] || [[ $input == yes ]]; then
  sudo apt install git vim tmux xterm -y
  rsync -avz $PWD/ $HOME --exclude /.git --exclude /README.md --exclude /setup.sh 
  xrdb .Xresources
  sudo update-alternatives --config x-terminal-emulator
  echo -e "${GREEN}-INSTALL SUCCESSFUL-" 
elif [[ $input == N ]] || [[ $input == n ]] || [[ $input == no ]]; then
  echo -e "${RED}-EXITING-" 
else
  echo -e "${RED}-INVALID INPUT-"
fi
