sudo chsh "$(id -un)" --shell "/usr/bin/zsh"
cd ~

curl -fsSL https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
tar xzf nvim-linux64.tar.gz

apt update -y && apt upgrade -y
apt install -y tmux ripgrep

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

source .zshrc
