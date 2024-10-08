# Quick alias edit
alias edit-alias='code ~/.bash_aliases'

## Rusty tools
# ls
alias ls='exa'
alias tls='/usr/bin/ls'
# ls alias
alias ll='exa -alFh'
alias la='exa -a'
alias l='exa -Flh'
# grep
alias grep='rg'
alias tgrep='/usr/bin/grep'
# cat
alias cat='bat'
alias tcat='/usr/bin/cat'

# TODO change this tools for rusty tools
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# local http server
alias server='simple-http-server --nocache --upload ---coep --coop'

# Pictures in the terminal
alias icat='kitty +kitten icat --scale-up'

# FZF
alias interactive_find='fzf -m --preview="bat --color=always {}"'
