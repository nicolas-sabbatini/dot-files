case $- in
    *i*) ;;
      *) return;;
esac

# Para que el ctrl+s no me conjele la terminal
stty -ixon

# Historial
# Ignorar las lineas repetidas
HISTCONTROL=ignoreboth
# Tamaño del historal en memoria y en disco
HISTSIZE=10000
HISTFILESIZE=20000
# Concatenar al final de del historial
shopt -s histappend

# Tamaño de la venana
# Si algun comando cambia el tamaño de la ventana actualizar lineas y columnas
shopt -s checkwinsize

# Less
# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


# Colores para GCC
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Saber si estoy parado en una espacio virtual
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Alias
if [ -f $HOME/.bash_aliases ]; then
    . $HOME/.bash_aliases
fi

# Prompt
export PROMPT="FULL"
. $HOME/.config/prompt/prompt.sh

# Exports
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.config/prompt/scripts:$PATH"
export EDITOR="/usr/bin/vim"

source "$HOME/.cargo/env"

# nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"


