# OVERVIEW

## Configuration files

# ZSH reads the following configuration files:
# /etc/zshenv       ~/.zshenv
# IF the shell is a login shell
# /etc/zprofile     ~/.zprofile
# IF the shell is interactive:
# /etc/zshrc        ~/.zshrc
# IF the shell is a login shell:
# /etc/zlogin       ~/.zlogin

# On logout, it reads:
# /etc/zlogout      ~/.zlogout



# BASIC CONFIGURATION

# The following sets up low-level things, like history, completion and the prompt.


## Behaviour

# Recommended by Brew installer
unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/helpfiles

# Like Vim
bindkey -v

# 'Word' definition e.g. for ^W
autoload select-word-style
select-word-style shell

# Change directory automatically if no other commands given
setopt auto_cd

# Display CPU usage for commands >10s
REPORTTIME=10


## History

HISTFILE=~/.zhistory
HISTSIZE=SAVEHIST=10000
setopt incappendhistory 
setopt extendedhistory


## Prompt

# Colour
autoload -U colors && colors

# Time and date; MISSING rvm status; MISSING git status
# Host and current directory
# The prompt itself
PROMPT_TIME_AND_DATE="%B%{$fg[white]%}%* %D{%a %b %d}%b%{$reset_color%}"
PROMPT_HOST_AND_DIR="%{$fg[yellow]%}%M:%{$reset_color%} %d"
PROMPT_ITSELF="%{$fg[green]%}%n%#%_ %{$reset_color%}"

# Get some cool git info
source ~/.zsh.d/git-prompt/zshrc.sh

setopt PROMPT_SUBST # Turn on prompt command substitution
PROMPT='$PROMPT_TIME_AND_DATE $(git_super_status)
$PROMPT_HOST_AND_DIR
$PROMPT_ITSELF'


## Window title

# precmd is run before drawing the prompt, to refresh the title if something has changed.
precmd() {
  echo -ne "\e]1;$PWD\a"
  #echo -ne "\e]1;$USER@$HOST:$PWD\a"
}


## Completion

autoload -Uz compinit
fpath=(~/.zsh.d/zsh-completions $fpath) # Include custom completions.
compinit -u

# From both ends
setopt completeinword

# Case-insensitive
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Killall completion
zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'

# From http://www.linux-mag.com/id/1106/
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'


## ls colors
export LS_COLORS='hegxdghghfDbdbgfdfdece'
export ZLSCOLORS="${LS_COLORS}"
export LSCOLORS="${LS_COLORS}"
zmodload -i zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'



# ALIASES


## ls
alias ls='ls -G'
alias ll='ls -lh'
alias la='ls -lah'


## cd and related
alias dirs='dirs -v'


## top
alias topcpu='top -u -R -F -s5 -n30'
alias topmem='top -o rsize -s10 -n30'


## vim
#alias vim='mvim'


## grep
alias grepl='grep --color=always -iRnH'


## builtins
alias pd=pushd
alias dp=popd

## turn MacBook keyboard on and off
alias kboff='sudo kextunload /System/Library/Extensions/AppleUSBTopCase.kext/Contents/PlugIns/AppleUSBTCKeyboard.kext'
alias kbon='sudo kextload /System/Library/Extensions/AppleUSBTopCase.kext/Contents/PlugIns/AppleUSBTCKeyboard.kext'

# RUBY CONFIG
# Makes things faster but uses more memory:
# https://gist.github.com/1688857
export RUBY_GC_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=100000000
export RUBY_HEAP_FREE_MIN=500000


# CLOSING ITEMS

# These are things that, for whatever reason, have to come last.


## RVM + zsh + iTerm2

# http://beginrescueend.com/integration/zsh/
#__rvm_project_rvmrc

alias ctags=/usr/local/bin/ctags
alias thebackscratchers="ssh deploy@ec2-54-247-191-232.eu-west-1.compute.amazonaws.com"

# These paths are added in .zshenv, but don't seem to make it through login to the environment.
#path=(/usr/local/sbin $path) # Add /usr/local/sbin as requested by brew.
#path=(/usr/local/bin $path) # Prepend /usr/local/bin so it overrides system-installed binaries.

# Cabal path
# Can't remember why this was necessary.
#path=(~/.cabal/bin $path)
