# Quick alias edit
alias edit-alias-vim='vim ~/.bash_aliases'

# Colors
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# ls alias
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CFlh'

# Misc
alias server='simple-http-server --nocache --upload .'
alias vim='nvim'

# Acer Predator G3-572
alias fan_full='mono /opt/nbfc/nbfc.exe set -f 0 -s 100; mono /opt/nbfc/nbfc.exe set -f 1 -s 100' 
alias fan_auto='mono /opt/nbfc/nbfc.exe set -f 0 -a; mono /opt/nbfc/nbfc.exe set -f 1 -a'
alias fan_status='mono /opt/nbfc/nbfc.exe status'

alias go-to-hard-drive='cd /run/media/nicolas/HDD'

alias play-midi='timidity'
alias love='~/Applications/love-11.3-x86_64.AppImage'
alias manage-docker='docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v /yourpath:/.config/jesseduffield/lazydocker lazyteam/lazydocker'

alias revisar-vulkan='/usr/share/vulkan/icd.d'

