eval "$(/opt/homebrew/bin/brew shellenv)"

source $(brew --prefix)/share/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundles <<EOBUNDLES
	git
	zsh-users/zsh-autosuggestions
	zsh-users/zsh-completions
	zsh-users/zsh-syntax-highlighting
EOBUNDLES
antigen theme robbyrussell
antigen apply
