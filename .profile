#load bash
if [ -n "$BASH_VERSION" ]; then
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi

#set path
PATH="$HOME/bin:$HOME/.local/bin:$PATH"
