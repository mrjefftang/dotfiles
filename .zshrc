# Load zprof
# zmodload zsh/zprof

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="bullet-train"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Bullettrain Settings
BULLETTRAIN_PROMPT_SEPARATE_LINE=false
BULLETTRAIN_PROMPT_ADD_NEWLINE=false
BULLETTRAIN_STATUS_EXIT_SHOW=true
BULLETTRAIN_TIME_12HR=true
BULLETTRAIN_IS_SSH_CLIENT=true

BULLETTRAIN_PROMPT_ORDER=(
    time
    status
    custom
    context
    dir
    screen
    perl
    ruby
    virtualenv
    aws
    go
    rust
    elixir
    git
    hg
    cmd_exec_time
)


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew osx python pip screen vagrant)

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh_secret

# ssh-agent
# zstyle :omz:plugins:ssh-agent agent-forwarding on
# zstyle :omz:plugins:ssh-agent identities id_rsa

# Aliases
alias zshconfig="vi ~/.zshrc"
alias vi=mvim
alias vim=mvim -f
alias openssl='$(brew --prefix openssl)/bin/openssl'
alias man=man-preview
alias notes="vi ~/Documents/workspace.md"
alias msfconsole="docker run -it -e LHOST=$(ipconfig getifaddr en0) -p 4444:4444 -v ~/Projects/rapid7/metasploit-framework:/usr/src/metasploit-framework metasploit-framework"

# Environment settings
# export PS1="%{%F{green}%}[%{%F{red}%}%n%{%f%}@%{%F{blue}%}%m %{%F{yellow}%}%~ %{%F{green}%}]%{%F{white}%} %{$%f%}  "
export EDITOR=mvim

# Pyenv
export PATH=$PATH:/usr/local/opt/pyenv/bin
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
if which pyenv > /dev/null; then 
    eval "$(pyenv init -)"; 
    eval "$(pyenv virtualenv-init -)"
fi

# Rbenv
export PATH=$PATH:/usrlocal/opt/rbenv/bin
export RBENV_ROOT=/usr/local/opt/rbenv
if which rbenv > /dev/null; then 
    eval "$(rbenv init -)";
fi

# Go
export GOPATH=~/Projects/go
export PATH=$PATH:$GOPATH/bin

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

