
#    +-------------------------------------+
#    | .zshrc                              |
#    +-------------------------------------+
#    |                       __            |
#    |            ____  ____/ /_           |
#    |           /_  / / __/ __ \          |
#    |            / /_(__ ) / / /          |
#    |           /___/___/_/ /_/           |
#    |                                     |
#    |       - Configuration File -        |
#    |                                     |
#    +-------------------------------------+



# +-------------------------------------------------------------------------------------------------
# | General
# +-------------------------------------------------------------------------------------------------

# Default system editor
export EDITOR=vim

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# zsh config root
export ZSH_CONFIG_ROOT=$HOME/.zsh.d

# Workspace
#export WORKSPACE=/scratch

# Enable less mouse scrolling
#export LESS=-r

# Misc defaults
#export PROMPT_DIRTRIM=0
#export COLUMNS=$(tput cols)

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Show what modules to load
if [ -f "${ZSH_CONFIG_ROOT}/modules.conf" ]; then
    source "${ZSH_CONFIG_ROOT}/modules.conf"
fi

# use CTRL-s and CTRL-q in tmux
vim() { stty -ixon; command vim "$@"; stty -ixon; }


# +-------------------------------------------------------------------------------------------------
# | Oh-My-Zsh
# +-------------------------------------------------------------------------------------------------

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="darkblood"

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

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git)

source $ZSH/oh-my-zsh.sh


# +-------------------------------------------------------------------------------------------------
# | zsh
# +-------------------------------------------------------------------------------------------------

# History settings
# HIST_STAMPS="mm/dd/yyyy"

# Location of history file
HISTFILE=$ZSH_CONFIG_ROOT/zsh_history

# Size of history file
HISTSIZE=1000000

# 
#export HISTCONTROL="ignoreboth:erasedups"

# Define the size of history
SAVEHIST=10000

# An empty line after each command
precmd() {print ""}


# +-------------------------------------------------------------------------------------------------
# | Components Loading
# +-------------------------------------------------------------------------------------------------

clear

for FILE in ${bashrcComponent[@]}
do
    source "${ZSH_CONFIG_ROOT}/lib/$FILE.sh"
done


# +-------------------------------------------------------------------------------------------------
# | Appearance
# +-------------------------------------------------------------------------------------------------

# Print the shell worker info header
export PRINT_HEADER=1

# Print prompt with directory information, eg amount of files and size
#export DIRECTORY_INFO_PROMPT=1


# +-------------------------------------------------------------------------------------------------
# | Addons
# +-------------------------------------------------------------------------------------------------

#if [ -f "${BASHRC_CONFIG}/addons.sh" ]; then
#    source "${BASHRC_CONFIG}/addons.sh"
#fi

# +-------------------------------------------------
# | Non-Interactive Shell
# +-------------------------------------------------

#if [[ $- != *i* ]] ; then
#    # Shell is non-interactive.  Be done now!
#    return
#fi

# +-------------------------------------------------
# | Autoloading Stuff
# +-------------------------------------------------

# Really usefull, load bash auto completion
#if [ -f /etc/profile.d/bash_completion.sh ]; then
#    source /etc/profile.d/bash_completion.sh
#
#    if [ -d "${BASHRC_CONFIG}/completions" ]; then
#        for file in $(find "${BASHRC_CONFIG}/completions/" -type f) ; do
#            source "${file}"
#        done
#    fi
#fi


# +-------------------------------------------------
# | UTF8 Stuff
# +-------------------------------------------------

#export LC_ALL=de_DE.UTF-8
#export LANG=de_DE.UTF-8
#export LANGUAGE=de_DE.UTF-8

#if test -t 1 -a -t 2 ; then
#    echo -n -e '\033%G'
#fi

# +-------------------------------------------------
# | Terminal Settings
# +-------------------------------------------------

#if [ "$TERM" != 'linux' ]; then
#    # Set the default 256 color TERM
#    export TERM=xterm-256color
#fi

# +-------------------------------------------------
# | Runtime
# +-------------------------------------------------

# Find source root directory
#function __getBashRCSourceRoot()
#{
#    SOURCE="${BASH_SOURCE[0]}"
#    while [ -h "$SOURCE" ]; do
#        DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
#        SOURCE="$(readlink "$SOURCE")"
#        [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
#    done
#    DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
#    export BASHRC_SOURCE_ROOT="${DIR}"
#}

#__getBashRCSourceRoot

#export BASHRC_VERSION=$(cd "$BASHRC_SOURCE_ROOT" && git log --pretty="%h" -n1 HEAD)
#export PATH="$PATH:${BASHRC_SOURCE_ROOT}/../bin:${BASHRC_SOURCE_ROOT}/../vendors"


# +-------------------------------------------------
# | Binding Bash Events
# +-------------------------------------------------

# rebind enter key to insert newline before command output
#trap 'echo' DEBUG

#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

