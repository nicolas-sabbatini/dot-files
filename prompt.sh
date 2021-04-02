#!/bin/bash

armar_prompt() {
  # Return del ultimo comando
  local RET=$?
  local exit_code
  if [[ $RET == 0 ]];
  then
    exit_code="👌"
  else
    exit_code="🛑"
  fi
  
  # Colores de la terminal
  local purple="\e[1;35m"
  local bold="\\[\\e[1m\\]"
  local bold_none="\\[\\e[0m\\]"
  local light_green="\\[\\e[92m\\]"
  local white="\\[\\e[97m\\]"
  local none="\\[\\e[39m\\]"
  
  # Que imprimir en PS1
  local fin="${bold_none}${none}\n🔥️ "
  local usuario="${bold}${purple}\u"
  local camino
  local host=""

  if [ "$PROMPT" = "FULL" ]
  then
    camino="${white}: \w"
  else
    camino="${white}: \W"
  fi

  if [ "$HOSTNAME" != "pop-os" ]
  then
    host=" 🌐 ${light_green}\h"
  fi

  PS1="${usuario}${host}${camino}${fin}"

  # Cambiar el titulo de la terminal
  echo -ne "\033]0;${PWD} ${exit_code}\007"
 }
 
cambiar_prompt() {
  if [ $1 = 1 ]
  then
    export PROMPT="FULL"
  else
    export PROMPT="CURRENT"
  fi
}

PROMPT_COMMAND=armar_prompt

