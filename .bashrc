#aliases
alias ls='ls --color'
alias ll='ls -l --color'

#Prompt Color
export PS1="\[$(tput bold)\]\[\033[38;5;10m\]\u\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;11m\]\h\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;14m\]\w\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\]\\$ \[$(tput sgr0)\]"

#Default editor
export EDITOR='vim'
