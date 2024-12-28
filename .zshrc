eval "$(/opt/homebrew/bin/brew shellenv)"

source $(brew --prefix)/share/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundles <<EOBUNDLES
	git
EOBUNDLES
antigen theme robbyrussell
antigen apply
