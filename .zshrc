#ls aliases
alias l='ls --color=auto'
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -a --color=auto'

#cli prompt
PROMPT="%F{10}%n%f@%F{11}%m%f:%F{14}%~%f$ "

#autocomplete dir colors
eval "$(dircolors)"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

#default editor
export EDITOR='vim'
