#!/usr/bin/env bash
set -e

REPO_DIR="$HOME/god-vim-setup"

# 1) Install Neovim & deps
if [[ "$(uname)" == "Darwin" ]]; then
  echo "→ macOS detected"
  if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
  echo "Installing Neovim..."
  brew install neovim git curl
else
  echo "→ Linux detected"
  if command -v apt-get &>/dev/null; then
  
    sudo apt-get update
    sudo apt-get install -y neovim git curl
  elif command -v yum &>/dev/null; then
    sudo yum install -y neovim git curl
  elif command -v pacman &>/dev/null; then
    sudo pacman -Syu --noconfirm neovim git curl
  else
    echo "Unsupported package manager. Please install Neovim, git, and curl manually." >&2
    exit 1
  fi
fi

# 2) Install vim-plug for Neovim
curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim" \
     --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# 3) Symlink configs

ln -sf "$REPO_DIR/.vimrc" "$HOME/.vimrc"
mkdir -p "$HOME/.config/nvim"

ln -sf "$REPO_DIR/.vim" "$HOME/.vim"

# 4) Install all plugins
nvim +PlugInstall +qall

# 5) Finish
echo "🎉 Installation complete! Launch Neovim with 'nvim'. Enjoy!"
