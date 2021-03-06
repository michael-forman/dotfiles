# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git sudo z) 

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/opt/vagrant_ruby/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"


# Add the SSH key
if [ -z "$SSH_AUTH_SOCK" ] ; then
   eval `ssh-agent -s`
   ssh-add
fi

alias vish="vim ~/.zshrc && source ~/.zshrc"
alias du1="du -h --max-depth=1"

alias cdo="cd /opt/brightsparklabs/osmosis"
alias gcd="gco develop"
alias gclean="git remote prune origin"
alias gw="./gradlew"
alias gpu='git push --set-upstream origin `git symbolic-ref HEAD|sed -r "s:refs/heads/::g"`'
alias dp="docker ps -a"
alias cdb="cd /mnt/repos"
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# ------------------------------------
# Docker alias and function
# ------------------------------------

# Get latest container ID
alias dl="docker ps -l -q"

# Get container process
alias dps="docker ps"

# Get process included stop container
alias dpa="docker ps -a"

# Get images
alias di="docker images"

# Get container IP
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"

# Run deamonized container, e.g., $dkd base /bin/echo hello
alias dkd="docker run -d -P"

# Run interactive container, e.g., $dki base /bin/bash
alias dki="docker run -i -t -P"

# Execute interactive container, e.g., $dex base /bin/bash
alias dex="docker exec -i -t"

# Stop all containers
dstop() { docker stop $(docker ps -a -q); }

# Remove all containers
drm() { docker rm $(docker ps -a -q); }

# Stop and Remove all containers
alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

# Remove all images
dri() { docker rmi $(docker images -q); }

# Dockerfile build, e.g., $dbu tcnksm/test 
dbu() { docker build -t=$1 .; }

# Show all alias related docker
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }


alias startl="sudo -H -u osmosis /opt/brightsparklabs/osmosis/current/osmosis.sh -d -p lowside start"
alias stopl="sudo -H -u osmosis /opt/brightsparklabs/osmosis/current/osmosis.sh -d -p lowside stop"
alias downl="sudo -H -u osmosis /opt/brightsparklabs/osmosis/current/osmosis.sh -p lowside downscale"
alias upl="sudo -H -u osmosis /opt/brightsparklabs/osmosis/current/osmosis.sh -p lowside upscale"
alias starth="sudo -H -u osmosis /opt/brightsparklabs/osmosis/current/osmosis.sh -d -p highside start"
alias stoph="sudo -H -u osmosis /opt/brightsparklabs/osmosis/current/osmosis.sh -d -p highside stop"
alias downh="sudo -H -u osmosis /opt/brightsparklabs/osmosis/current/osmosis.sh -p highside downscale"
alias uph="sudo -H -u osmosis /opt/brightsparklabs/osmosis/current/osmosis.sh -p highside upscale"
alias trigger="/opt/brightsparklabs/osmosis/current/service/osmosis-ops/scripts/trigger-download.sh"
alias startdh="sudo -H -u osmosis /opt/brightsparklabs/osmosis-dev/scripts/osmosis-infrastructure.sh -p highside start"
alias stopdh="sudo -H -u osmosis /opt/brightsparklabs/osmosis-dev/scripts/osmosis-infrastructure.sh -p highside stop"
alias startd="sudo -H -u osmosis /opt/brightsparklabs/osmosis-dev/scripts/osmosis-infrastructure.sh start"
alias stopd="sudo -H -u osmosis /opt/brightsparklabs/osmosis-dev/scripts/osmosis-infrastructure.sh stop"
alias istartd="sudo -H -u insilico /opt/brightsparklabs/insilico-dev/scripts/insilico-infrastructure.sh start"
alias istopd="sudo -H -u insilico /opt/brightsparklabs/insilico-dev/scripts/insilico-infrastructure.sh stop"
alias istart="sudo -H -u insilico /opt/brightsparklabs/insilico/current/insilico.sh -d start"
alias istop="sudo -H -u insilico /opt/brightsparklabs/insilico/current/insilico.sh stop"



alias config='/usr/bin/git --git-dir=/home/michael/.cfg/ --work-tree=/home/michael'
