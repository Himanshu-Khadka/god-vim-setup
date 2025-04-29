# God Vim Setup

A one‑stop installer for Neovim (and Vim fallback), configured with your favorite plugins, keybindings, and themes. Clone into your home directory and run a single script to get up and running.

---

## 📂 Folder Structure

```plaintext
~/god-vim-setup
├── .vimrc          # main configuration
├── .vim/           # custom Vim scripts, snippets, colors
├── install.sh      # installer script
└── README.md       # this file
```

---

## 🚀 Installation

1. **Clone into ****`~/`**

   ```bash
   git clone https://github.com/<your‑username>/god‑vim‑setup.git ~/god‑vim‑setup
   ```

2. **Run the installer**

   ```bash
   cd ~/god‑vim‑setup
   bash install.sh
   ```

   The script will:

   - Detect your OS (macOS vs Linux) and install Neovim (and dependencies) via Homebrew, `apt`, `yum`, or `pacman`.
   - Install [vim-plug](https://github.com/junegunn/vim-plug) for plugin management.
   - Symlink `~/.vimrc` and `~/.config/nvim/init.vim` to this repo’s `.vimrc`.
   - Symlink `~/.vim/` to this repo’s `.vim/` directory.
   - Launch Neovim once to auto-install all plugins.

3. **Launch**

   ```bash
   nvim
   ```

---

## 🛠 Usage

- **Edit files**: `nvim <file>`
- **Open folder**: `nvim .`
- **Plugin commands**:
  - `:PlugInstall`  – install new plugins
  - `:PlugUpdate`   – update existing plugins
  - `:PlugClean`    – remove unused plugins

---

## ⌨️ Key Shortcuts & Mappings

| Shortcut        | Description                        |
| --------------- | ---------------------------------- |
| `<Leader>n`     | Toggle NvimTree file explorer      |
| `<F3>`          | Toggle NERDTree                    |
| `<F5>`          | Save & run current Python script   |
| `jj`            | Exit Insert mode                   |
| `<Space>` (cmd) | Enters `:` in Normal mode          |
| `n` / `N`       | Next / previous search, centered   |
| `<C-j>` `<C-k>` | Jump between splits (down / up)    |
| `<C-h>` `<C-l>` | Jump between splits (left / right) |
| `<Leader>\`     | Jump back to last cursor position  |

> **Leader** is set to `\` (backslash) by default.

---

## 🔧 install.sh (installer script)

 `install.sh`. It checks your OS, installs prerequisites, links configs, and bootstraps plugins.


## 📖 Further Customization

- To add/remove plugins, edit the `Plug '…'` lines in `.vimrc` and re-run `:PlugInstall`.
- Change color schemes or fonts under the `has('gui_running')` section.
- Add more mappings in the **MAPPINGS** block of `.vimrc`.

---

*Feel free to open issues or PRs on GitHub if you hit any snags!*\
— Happy editing! ✨

