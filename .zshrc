export PATH=~/nvim-linux64/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
export EDITOR=$(which nvim)
ZSH_THEME="robbyrussell"
alias vi="nvim"
alias vim="nvim"
plugins=(
git
tmux
zsh-autosuggestions
zsh-syntax-highlighting
)
ZSH_TMUX_AUTOSTART=true

source $ZSH/oh-my-zsh.sh
