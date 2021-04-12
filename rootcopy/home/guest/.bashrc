# Setup color scheme <brokenman> for list call
## hh: ll + "a"
alias ll='/bin/ls --color=auto -alF'
alias la='/bin/ls --color=auto -axF'
alias ls='/bin/ls --color=auto -xF'

# Append any additional sh scripts found in /etc/profile.d/:
for y in /etc/profile.d/*.sh ; do [ -x $y ] && . $y; done
unset y

# Setup shell prompt for root <wread and fanthom>
PS1='\n\[\033[01;32m\]\u@\h:\[\033[01;32m\]\w\n >\[\033[00m\] '
PS2='> '

if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi

. ~/.config/git/git-completion.bash
export TZ=Europe/Berlin
alias diff='diff --color=always'
setterm -inversescreen on
export PROMPT_COMMAND='printf "\033]0;%s\007" "${PWD/#*\//}"'
