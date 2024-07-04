export PATH=/opt/homebrew/bin:$HOME/go/bin:$HOME/.local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
export EDITOR=/opt/homebrew/bin/nvim
ZSH_THEME="robbyrussell"
alias vi="nvim"
alias vim="nvim"
alias flyctl="TERM=xterm-color flyctl"
# alias gh="TERM=xterm-256color gh"
plugins=(
git
tmux
zsh-autosuggestions
zsh-syntax-highlighting
)
ZSH_TMUX_AUTOSTART=true
export HOMEBREW_NO_ENV_HINTS=true

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(direnv hook zsh)"
eval "$(pyenv virtualenv-init -)"
source $(brew --prefix nvm)/nvm.sh
export NVM_DIR=~/.nvm
export HOMEBREW_PREFIX=/opt/homebrew

source $ZSH/oh-my-zsh.sh
