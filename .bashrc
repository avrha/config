#tmux
case $- in
  *i*) 
    if [ -z "$TMUX" ]; then
      tmux attach-session -t main || tmux new-session -s main
    fi
  ;;
esac

#command prompt
parse_git_branch() {
    git rev-parse --is-inside-work-tree &>/dev/null && \
    echo " ($(git branch --show-current))" || echo ""
}
export PS1='\[\e[96m\]\u\[\e[0m\]@\[\e[92m\]\h\[\e[0m\]:\[\e[33m\]\w\[\e[0m\]\[\e[31m\]$(parse_git_branch)\[\e[0m\]\$ '

#env variables
export EDITOR='vim'
export LESS='-N'

#aliases 
alias l='ls -h --color=auto'
alias ls='ls -h --color=auto'
alias ll='ls -lFh --color=auto'
alias la='ls -aFh --color=auto'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias gdb='gdb -q'
alias grep='grep --color=auto'
alias update-system='sudo apt update && sudo apt upgrade && sudo apt autoremove'

