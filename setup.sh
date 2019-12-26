#! /bin/bash
#extract files

echo "PLEASE NOTE: This script will overwrite files in your home directory. Backup is recommended."
echo "Continue installation? (y/n)"
read input

#installation 
if [[ $input == y ]] || [[ $input == yes ]]; then
  rsync -avz $PWD/ $HOME --exclude /.git --exclude /README.md --exclude /setup.sh
  echo "Installation complete, exting script"
else
  echo "Exiting script"
fi
