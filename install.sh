# sudo chsh "$(id -un)" --shell "/usr/bin/zsh"
cd ~

touch doesitwork

curl -fsSL https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
tar xzf nvim-linux64.tar.gz

apt update -y && apt upgrade -y
apt install -y stow tmux ripgrep

rm -rf .config .zshrc
git clone https://github.com/toxeeec/dotfiles
cd dotfiles
stow .

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

source .zshrc
