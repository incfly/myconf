# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#
# Jianfei Hu has its own robbyrussel theme file
# should place modified version under .oh-my-zsh/themes folder
# seems that author of this theme already considers that, so it's no longer needed
ZSH_THEME="robbyrussell"


# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git golang)

# Causing many copy paste url problems...
# https://github.com/robbyrussell/oh-my-zsh/issues/5569
export DISABLE_MAGIC_FUNCTIONS=true

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/texbin:$HOME/bin
# TODO: enable this cause cursor move problem, random place...
# export PROMPT="$fg[cyan]%}$USER@%{$fg[blue]%}%m ${PROMPT}"
unsetopt correct_all 

eval `dircolors $HOME/workspace/myconf/zsh/.dir_colors`

# https://github.com/ahmetb/kubectl-aliases/blob/master/.kubectl_aliases
source $HOME/workspace/myconf/zsh/.kubectl_aliases
source $HOME/workspace/myconf/misc_scripts/z/z.sh
source $HOME/workspace/myconf/golang/config.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

for i in $HOME/workspace/myconf/zsh/*.sh; do
  source $i
done

# Add Rust to PATH
[ -f ~/.cargo/env ] && source ~/.cargo/env


alias python=python3
alias watch='watch '
alias wt='watch '
alias ta='tmux attach'
alias ki="${HOME}/workspace/go/src/incfly/sysamples/istio/ki.py"
