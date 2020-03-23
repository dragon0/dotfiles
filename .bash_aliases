# vi: filetype=sh

################################################################
# Prompt
if [[ ! $PS1 =~ "\n" ]] 
then
    pslen=$(expr length "$PS1" - 3)
    pssub=${PS1:0:$pslen}
    PS1="$pssub\n$ "
fi

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
# Program-Specific Configurations

# haskellstack configuration
type stack >/dev/null 2>&1 && eval "$(stack --bash-completion-script stack)"

# OPAM configuration
. /home/sean/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# cargo configuration
test -e "$HOME/.cargo/env" && source "$HOME/.cargo/env"

# pyenv configuration
export PATH="/home/sean/.pyenv/bin:$PATH"
type pyenv > /dev/null 2>&1 && ( eval "$(pyenv init -)"; eval "$(pyenv virtualenv-init -)")


# nvm/nodejs
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

