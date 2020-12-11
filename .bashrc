#uxterm pid
var=$(ps -ax | grep uxterm)
pid=${var:0:5}

#exit alias
function exit { kill -9 "$pid" && pkill -f tmux && rm .*.swp;}
export -f exit

#exit binding
bind -x '"\C-j":"exit"'

#tmux
if command -v tmux>/dev/null; then
  [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && tmux -2
  fi
    
#aliases
alias ls='ls --color'
alias ll='ls -l --color'
alias la='ls -a --color'
    
#prompt
export PS1='\[\e[36m\]\u\[\e[0m\]@\[\e[32m\]\h\[\e[0m\]:\[\e[33m\]\w\[\e[0m\]$ '
    
#default editor
export EDITOR='vim'
