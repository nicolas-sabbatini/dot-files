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
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Colores para GCC
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Saber si estoy parado en una espacio virtual
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Alias
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Prompt
export PROMPT="FULL"
. ~/.config/bash/prompt.sh

# Xterm poner tirulo
put_title()
{
  __el_LAST_EXECUTED_COMMAND="${BASH_COMMAND}"
  printf "\033]0;%s\007" "$1"
}
update_tab_command()
{
    # catch blacklisted commands and nested escapes
    case "$BASH_COMMAND" in 
        *\033]0*|update_*|echo*|printf*|clear*|cd*)
        __el_LAST_EXECUTED_COMMAND=""
            ;;
        *)
        put_title "${BASH_COMMAND}"
        ;;
    esac
}
preexec_functions+=(update_tab_command)

# Exports
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/Scripts:$PATH"
export EDITOR="/usr/bin/vim"

