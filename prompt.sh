#!/bin/bash

build_prompt() {
  # Get return of the last command
  local RET=$?
  local exit_code
  if [[ $RET == 0 ]]; then
    exit_code="👌"
  else
    exit_code="🛑"
  fi

  # Prompt colors
  local purple="\e[1;35m"
  local bold="\\[\\e[1m\\]"
  local bold_none="\\[\\e[0m\\]"
  local light_green="\\[\\e[92m\\]"
  local white="\\[\\e[97m\\]"
  local none="\\[\\e[39m\\]"

  # Building blocks of PS1
  local fin="${bold_none}${none}\n🔥️ "
  local usuario="${bold}${purple}\u"
  local camino
  local host=""

  # If the prompt is in full path
  if [ "$PROMPT" = "FULL" ]; then
    camino="${white}: \w"
  else
    camino="${white}: \W"
  fi

  # Host name
  if [ "$HOSTNAME" != "fedora" ]; then
    host=" 🌐 ${light_green}\h"
  fi

  PS1="${usuario}${host}${camino}${fin}"

  # Change terminal title
  echo -ne "\033]0;${PWD} ${exit_code}\007"
}

change_prompt_mode() {
  if [ $1 = 1 ]; then
    export PROMPT="FULL"
  else
    export PROMPT="CURRENT"
  fi
}

PROMPT_COMMAND=build_prompt && history -a
