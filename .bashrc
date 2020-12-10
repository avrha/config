#Aliases
alias ls='ls --color'
alias ll='ls -l --color'
alias la='ls -a --color'

#Prompt
export PS1='\[\e[36m\]\u\[\e[0m\]@\[\e[32m\]\h\[\e[0m\]:\[\e[33m\]\w\[\e[0m\]$ '

#Default Editor
export EDITOR='vim'

#256 Colors
export TERM=xterm-256color

#Use tmux
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi
