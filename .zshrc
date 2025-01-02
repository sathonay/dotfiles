
#export MYVIMRC="/.vimrc"
#export VIMINIT=":set runtimepath+=$DOTFILES/.vim/**|:source $MYVIMRC"

export PATH="$HOME/fastfetch/build:$PATH"

alias smallfetch="fastfetch -c $HOME/fastfetch_conf/small.jsonc"
alias reportfetch="fastfetch -c $HOME/fastfetch_conf/report.jsonc"
alias ..="cd .."
alias vime="vim +Explore"

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
source $ZSH/oh-my-zsh.sh
smallfetch
