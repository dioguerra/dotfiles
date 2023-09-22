# Alias definitions.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Virtual Envs
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/ws
export VIRTUALENVWRAPPER_SCRIPT=$HOME/.local/bin/virtualenvwrapper.sh
source $HOME/.local/bin/virtualenvwrapper_lazy.sh

# Prompt Setup
# curl -o ~/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
#source ~/.git-prompt.sh
#export PS1='\[\e[31m\]\u\[\e[90m\]@\[\e[34m\]\h \[\e[33m\]\w\[\e[37m\]$(__git_ps1 " (%s)")\[\e[90m\]\$ \[\e[39m\]'
#export PROMPT_DIRTRIM=3

# Prompt-2
source $HOME/.trueline/trueline.sh

# DualScreens

# Coding Languages
## GOlang
export PATH=$PATH:/usr/local/go/bin
export GOPATH="$HOME/go"
## Rust
. "$HOME/.cargo/env"

### Containerized Programs
alias swagger='nerdctl run --rm -it --user $(id -u):$(id -g) -v $HOME:$HOME -w $PWD registry.cern.ch/quay.io/goswagger/swagger'
alias openapi='sudo nerdctl run --rm -it  --user $(id -u):$(id -g) -v $HOME:$HOME -w $PWD registry.cern.ch/docker.io/openapitools/openapi-generator-cli:latest-release'
#alias cosign='nerdctl run --rm -it --user $(id -u):$(id -g) -v $HOME:$HOME gcr.io/projectsigstore/cosign:latest'
alias skopeo='sudo nerdctl run --rm -it  registry.cern.ch/quay.io/skopeo/stable'
alias pgadmin4='python3 -m venv pgadmin4 && source pgadmin4/bin/activate && pgadmin4'

## Other
export EDITOR=vim
export PATH=$PATH:/opt/cmake-3.27.0-rc2-linux-x86_64/bin/
