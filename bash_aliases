alias edit-alias-vim='vim ~/.bash_aliases'
alias edit-alias-code='code ~/.bash_aliases'

# Alias con colores
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Alias para ls
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# The fuck
eval "$(thefuck --alias)"

# Alerta
alias alerta='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Varios
alias server='http-server .'

