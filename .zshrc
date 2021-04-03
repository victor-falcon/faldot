# If you come from bash you might have to change your $PATH.
export LC_ALL=en_US.UTF-8

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export FALDOT="$HOME/.faldot"

# Themes
ZSH_THEME="robbyrussell"

# Plugins
plugins=(git zsh-autosuggestions z)

export FZF_DEFAULT_OPTS='--no-height --no-reverse'
setopt hist_ignore_all_dups hist_save_nodups

source $ZSH/oh-my-zsh.sh

# 
# User configuration
# 
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim

HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE

setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share history between different instances of the shell

# Fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# -
# Aliases
#
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias g='git'

# Laravel Sail
alias sail='./vendor/bin/sail'

# Config repo
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

#
# Keybindings
#
bindkey '^e' edit-command-line

eval "$(starship init zsh)"
export STARSHIP_CONFIG="$FALDOT/.starship"
