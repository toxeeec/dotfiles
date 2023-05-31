export PATH=/opt/homebrew/bin:$HOME/go/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
export EDITOR=/opt/homebrew/bin/nvim
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
export HOMEBREW_NO_ENV_HINTS=true
source $ZSH/oh-my-zsh.sh
