#uxterm id
var=$(ps -ax | grep uxterm)
pid=${var:0:5}

#exit alias
function exit { kill -9 "$pid" && pkill -f tmux && rm .*.swp;}
export -f exit

#exit bind
if [ -t 1 ]; then
  bind -x '"\C-k":"exit"'
fi

#launch tmux
case $- in *i*)
  [ -z "$TMUX" ] && exec tmux -2
esac

#ls aliases
alias ls='ls --color'
alias ll='ls -l --color'
alias la='ls -a --color'

#command prompt
export PS1='\[\e[36m\]\u\[\e[0m\]@\[\e[32m\]\h\[\e[0m\]:\[\e[33m\]\w\[\e[0m\]$ '

#default editor
export EDITOR='vim'
