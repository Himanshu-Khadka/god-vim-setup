#!/bin/bash

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 1) Install Neovim & deps
if [[ "$OSTYPE" == "darwin"* ]]; then
  echo "→ macOS detected"
  if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
  echo "Installing Neovim, git, curl via brew..."
  brew install neovim git curl
else
  echo "→ Linux detected"
  # Debian/Ubuntu
  if command -v apt &>/dev/null; then
    echo "Installing Neovim, git, curl via apt..."
    sudo apt update
    sudo apt install -y neovim git curl
  # RedHat/CentOS
  elif command -v yum &>/dev/null; then
    echo "Installing Neovim, git, curl via yum..."
    sudo yum install -y neovim git curl
  # Arch Linux
  elif command -v pacman &>/dev/null; then
    echo "Installing Neovim, git, curl via pacman..."
    sudo pacman -Sy --noconfirm neovim git curl
  else
    echo "Please install Neovim, git, and curl manually."
    exit 1
  fi
fi

# 2) Install vim-plug for Vim
curl -fLo "$HOME/.vim/autoload/plug.vim" \
     --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# 3) Install vim-plug for Neovim
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim \
     --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# 4) Symlink config files
echo "Linking config files..."
ln -sf "$REPO_DIR/.vimrc" "$HOME/.vimrc"
ln -sf "$REPO_DIR/init.vim" "$HOME/.config/nvim/init.vim"

# Ensure Vim directory and subfolders exist for plugins and customizations
mkdir -p "$HOME/.vim/autoload" "$HOME/.vim/plugged" "$HOME/.vim/colors"
# Link custom colors or scripts if you have them
ln -sf "$REPO_DIR/.vim/colors" "$HOME/.vim/colors"

# 5) Install plugins
echo "Installing plugins for Vim and Neovim..."
vim +PlugInstall +qall
nvim +PlugInstall +qall

echo "Setup complete!"
