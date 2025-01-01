export DOTFILES="$HOME/.files"

export MYVIMRC="$DOTFILES/.vimrc"
export VIMINIT=":set runtimepath+=$DOTFILES/.vim/**|:source $MYVIMRC"

alias ..="cd .."
alias vime="vim +Explore"

export ZSH="$DOTFILES/.oh-my-zsh"
ZSH_THEME="robbyrussell"
source $ZSH/oh-my-zsh.sh
