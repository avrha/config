# Launch tmux, exclude VS Code
if [[ -z "$TMUX" ]] && [[ "$TERM_PROGRAM" != "vscode" ]]; then
  exec tmux -2
fi

# Command prompt
parse_git_branch() {
    git rev-parse --is-inside-work-tree &>/dev/null && \
    echo " ($(git branch --show-current))" || echo ""
}
export PS1='\[\e[96m\]\u\[\e[0m\]@\[\e[92m\]\h\[\e[0m\]:\[\e[33m\]\w\[\e[0m\]\[\e[31m\]$(parse_git_branch)\[\e[0m\]\$ '

# Env variables
export EDITOR='vim'
export LESS='-RN'

# Aliases
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

