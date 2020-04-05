#!/bin/bash

armar_prompt() {
  local purple="\e[1;35m"
  local bold="\\[\\e[1m\\]"
  local bold_none="\\[\\e[0m\\]"
  local light_green="\\[\\e[92m\\]"
  local white="\\[\\e[97m\\]"
  local none="\\[\\e[39m\\]"
  
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

  if [ "$HOSTNAME" != "nitro-5" ]
  then
    host=" 🌐️ ${light_green}\h"
  fi

  PS1="${usuario}${host}${camino}${fin}"

}

cambiar_prompt() {
  if [ $1 = 1 ]
  then
    export PROMPT="FULL"
  else
    export PROMPT="CURRENT"
  fi
  armar_prompt
}

armar_prompt