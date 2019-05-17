# vi: filetype=sh

################################################################
# Prompt
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\n\$ '
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*|screen)
    #PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    PS1="\[\e]0;\w (${debian_chroot:+($debian_chroot)}\u@\h)\a\]$PS1"
    ;;
*)
    ;;
esac

[[ -z "${VIRTUAL_ENV}" ]] || PS1="\[\033[01;34m\]\$(basename '$VIRTUAL_ENV')\[\e[0m\] $PS1"

################################################################
# Path
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" -a ! -L "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

################################################################
# Aliases

#alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias info='pinfo'
#alias mkdir='mkdir -p'
alias rm='rm -Iv'
#alias venv='python3 -m virtualenv -p python3'

################################################################
# Shell options

unset command_not_found_handle
# Report  the status of terminated background jobs immediately
set -b

################################################################
# Other Variables

export LESS='-M'
export DOOMWADDIR='/home/sean/wads'
#export CLASSPATH='.:/usr/share/java/*'
#export PYTHONPATH='/home/sean/PyProjects/'
export LEOCAD_LIB='~/Downloads/LeoCAD-Library-Linux-8750.zip'
export LC_COLLATE=C

################################################################
# Program-Specific Configurations

type stack >/dev/null 2>&1 && eval "$(stack --bash-completion-script stack)"

# OPAM configuration
. /home/sean/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

