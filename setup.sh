#!/bin/bash

# Color Variables
RED='\033[0;31m'
GREEN='\u001b[32m'
YELLOW='\u001b[33m'
NC='\033[0m'

# Ensure script is run as root
if [[ $EUID -ne 0 ]]; then
  echo -e "${RED}-ERROR-${NC} This script must be run as root."
  exit 1
fi

echo -e "${RED}-WARNING-${NC} Any existing configuration files will be overwritten. Backup is recommended."
echo -e "Would you like to backup your existing config files? ${GREEN}Y${YELLOW}/${RED}N${NC}"
read -r backup_input

# Backup Directory
BACKUP_DIR="$HOME/config_backup_$(date +%Y%m%d_%H%M%S)"

case "$backup_input" in
  [Yy]|[Yy][Ee][Ss])
    echo -e "${GREEN}Creating backup in:${NC} $BACKUP_DIR"
    mkdir -p "$BACKUP_DIR"

    CONFIG_FILES=(".bashrc" ".vimrc" ".tmux.conf" ".inputrc" ".Xresources" ".profile")
    for file in "${CONFIG_FILES[@]}"; do
      if [[ -f "$HOME/$file" ]]; then
        cp "$HOME/$file" "$BACKUP_DIR/"
        echo -e "${GREEN}Backed up:${NC} $file"
      else
        echo -e "${YELLOW}Skipping (not found):${NC} $file"
      fi
    done
    ;;
  [Nn]|[Nn][Oo])
    echo -e "${YELLOW}-Skipping backup-${NC}"
    ;;
  *)
    echo -e "${RED}-INVALID INPUT-${NC} Please enter Y or N."
    exit 1
    ;;
esac

echo -e "Proceed with installing the new config? ${GREEN}Y${YELLOW}/${RED}N${NC}"
read -r input

# Installation
case "$input" in
  [Yy]|[Yy][Ee][Ss])
    echo -e "${GREEN}Installing required packages...${NC}"
    if ! apt-get install -y xclip vim tmux xterm; then
      echo -e "${RED}-ERROR-${NC} Package installation failed."
      exit 1
    fi

    echo -e "${GREEN}Copying new configuration files...${NC}"
    for file in "${CONFIG_FILES[@]}"; do
      if [[ -f "$PWD/$file" ]]; then
        cp "$PWD/$file" "$HOME/"
        echo -e "${GREEN}Copied:${NC} $file"
      else
        echo -e "${YELLOW}Skipping (not found):${NC} $file"
      fi
    done

    if [[ -f "$HOME/.Xresources" ]]; then
      echo -e "${GREEN}Applying Xresources...${NC}"
      xrdb "$HOME/.Xresources"
    else
      echo -e "${YELLOW}Skipping Xresources: .Xresources file not found.${NC}"
    fi

    echo -e "${GREEN}Setting default terminal emulator...${NC}"
    update-alternatives --config x-terminal-emulator

    echo -e "${GREEN}Downloading and installing terminal font...${NC}"
    wget https://github.com/supercomputra/SF-Mono-Font/blob/master/SFMono-Medium.otf
    mv SFMono-Medium.otf /usr/local/share/fonts

    # Modify GRUB
    case "$grub_input" in
      [Yy]|[Yy][Ee][Ss])
        echo -e "${RED}-WARNING-${NC} This will modify your GRUB settings, modify GRUB?"
        echo -e "${GREEN}Updating GRUB configuration...${NC}"
        echo 'GRUB_BACKGROUND=""' | tee -a /etc/default/grub
        update-grub
        echo -e "${GREEN}-GRUB UPDATE SUCCESSFUL-${NC}"
        ;;
      [Nn]|[Nn][Oo])
        echo -e "${YELLOW}-Skipping GRUB update-${NC}"
        ;;
      *)
        echo -e "${RED}-INVALID INPUT-${NC} Please enter Y or N."
        exit 1
        ;;
    esac

    echo -e "${GREEN}-INSTALL SUCCESSFUL-${NC}"
    ;;
  
  [Nn]|[Nn][Oo])
    echo -e "${RED}-EXITING-${NC}"
    exit 0
    ;;
  
  *)
    echo -e "${RED}-INVALID INPUT-${NC} Please enter Y or N."
    exit 1
    ;;
esac

