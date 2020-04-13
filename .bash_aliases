# vi: filetype=sh

################################################################
# Prompt
# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
    *)
        if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
            # We have color support; assume it's compliant with Ecma-48
            # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
            # a case would tend to support setf rather than setaf.)
            color_prompt=yes
        else
            color_prompt=
        fi
        ;;
esac

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n\t \$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\n\t \$ '
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
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

alias drun='docker run -it --rm -u 1000:1000 -v "$(pwd):/app" -w /app'

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
# Customizations

function doit {
    until "$@"
    do
        echo ========
        echo retrying
        echo
    done
}

################################################################
# Program-Specific Configurations

# haskellstack configuration
type stack >/dev/null 2>&1 && eval "$(stack --bash-completion-script stack)"

# OPAM configuration
. /home/sean/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# cargo configuration
test -e "$HOME/.cargo/env" && source "$HOME/.cargo/env"

# pyenv configuration
export PATH="/home/sean/.pyenv/bin:$PATH"
if type pyenv > /dev/null 2>&1 
then
     eval "$(pyenv init -)"
     eval "$(pyenv virtualenv-init -)"
fi


# nvm/nodejs
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/sean/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/home/sean/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/sean/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/home/sean/Downloads/google-cloud-sdk/completion.bash.inc'; fi
