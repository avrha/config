#tmux
case $- in *i*)
  [ -z "$TMUX" ] && exec tmux -2
esac

#ls aliases
alias l='ls --color'
alias ls='ls --color'
alias ll='ls -l --color'
alias la='ls -a --color'

#command prompt
export PS1='\[\e[96m\]\u\[\e[0m\]@\[\e[92m\]\h\[\e[0m\]:\[\e[33m\]\w\[\e[0m\]$ '

#default editor
export EDITOR='vim'

