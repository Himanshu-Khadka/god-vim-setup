# God Vim Setup

A one‑stop installer for Neovim (and Vim fallback), configured with essential plugins, keybindings, and themes. Clone this repo into your home directory and run a single script to get up and running.

---

## 📂 Folder Structure

```plaintext
~/god-vim-setup
├── .vimrc          # Main Vim/Neovim configuration
├── init.vim        # Neovim-specific settings (symlinked automatically)
├── .vim/           # Custom Vim scripts, snippets, and color schemes
├── install.sh      # Automated installer script
└── README.md       # This file
```

---

## 🧰 Tools & Dependencies Installed

The installer sets up the following on your system:

- **Neovim** (with Vim fallback if you prefer)
- **Vim-plug** plugin manager for Vim and Neovim
- **Git** (for managing plugins and cloning repos)
- **cURL** (for downloading vim-plug and themes)
- **Homebrew** (on macOS)
- **apt**, **yum**, or **pacman** (on Linux, depending on your distro)

---

## 🚀 Installation Steps

1. **Clone the repository** into your home directory:
   ```bash
   git clone https://github.com/<your‑username>/god‑vim‑setup.git ~/god‑vim‑setup
   ```
2. **Run the installer**:
   ```bash
   cd ~/god-vim-setup
   bash install.sh
   ```
   This script will:
   - Detect your OS (macOS vs. Linux) and install dependencies.
   - Install `vim-plug` for both Vim and Neovim.
   - Link your config files (`.vimrc` and `init.vim`) into place.
   - Copy or symlink your custom `.vim/` folder (colors, snippets, scripts).
   - Auto-install all plugins via `:PlugInstall`.

3. **Launch your editor**:
   ```bash
   nvim
   ```

---

## 🔧 Usage & Common Commands

- **Open a file**: `nvim <file>`
- **Open a directory**: `nvim .`
- **Plugin management**:
  - `:PlugInstall` – install new plugins
  - `:PlugUpdate`  – update installed plugins
  - `:PlugClean`   – remove unused plugins
- **Move between splits**: `<C-h>`, `<C-j>`, `<C-k>`, `<C-l>`
- **Toggle file tree**: `<Leader>n` (NvimTree) or `<F3>` (NERDTree)
- **Run a Python script**: `<F5>` (saves file and executes)

---

## 📌 Notes & Best Practices

- **Backup your current configs** before running the installer if you have an existing setup.
- **Edit plugins**: To add or remove plugins, update the `call plug#begin()` / `call plug#end()` block in your `.vimrc` or `init.vim`, then run `:PlugInstall`.
- **Custom scripts & snippets**: Place any custom Vim scripts in `.vim/` (e.g., `snippets/`, `ftplugin/`, etc.). The installer will copy or link this folder into `~/.vim/`.

---

## 🎨 Theme Management

1. **Add custom themes**: Drop any `.vim` or `.lua` color scheme files into:
   - Vim: `~/.vim/colors/`
   - Neovim: `~/.config/nvim/colors/`
2. **Set a default theme**: In your `.vimrc` or `init.vim`, add:
   ```vim
   colorscheme <your-theme-name>
   ```
3. **Automate theme setup**: The installer can append a default theme setting. To set `gruvbox` by default, add the following at the end of `install.sh` (before the final echo):
   ```bash
   # Set default colorscheme
   echo "colorscheme gruvbox" >> "$HOME/.vimrc"
   echo "colorscheme gruvbox" >> "$HOME/.config/nvim/init.vim"
   ```

---

## 🔍 Troubleshooting

- **Missing plugins**: Run `:PlugInstall` again or check your internet connection.
- **Wrong colors**: Ensure your terminal supports true color and you have set `export TERM="xterm-256color"` in your shell.
- **Permission issues**: If `install.sh` fails, ensure it's executable (`chmod +x install.sh`) and you have `sudo` access for system installs.

---

*Happy coding! Feel free to open issues or pull requests on GitHub if you run into any problems.*