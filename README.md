# Neovim configuration

This repository contains my custom Neovim configuration for 2024 based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim). It includes features like LSP, syntax highlighting, Git integration, and more.

## Folder Structure

```text
.
├── README.md
├── init.lua
├── lazy-lock.json
└── lua
    ├── core
    │   ├── keymaps.lua
    │   ├── options.lua
    │   └── snippets.lua
    └── plugins
        ├── alpha.lua
        ├── autocompletion.lua
        ├── bufferline.lua
        ├── colortheme.lua
        ├── comment.lua
        ├── copilot-cmp.lua
        ├── copilot.lua
        ├── gitsigns.lua
        ├── indent-blankline.lua
        ├── lazydocker.lua
        ├── lazygit.lua
        ├── lsp.lua
        ├── lualine.lua
        ├── misc.lua
        ├── neotree.lua
        ├── none-ls.lua
        ├── telescope.lua
        └── treesitter.lua
```

## Features

- **LSP**: Configured with multiple language servers for robust development environments.
- **Autocompletion**: Includes `nvim-cmp` and Copilot integration for code suggestions.
- **File explorer**: `NeoTree` is set up for an enhanced file navigation experience.
- **Statusline**: Customized with `lualine` for a visually appealing and informative status bar.
- **Git Integration**: Git functionality is managed with `gitsigns` and `lazygit`.
- **Syntax Highlighting**: Enabled with `treesitter` for advanced highlighting based on code structure.
- **Theme**: A color scheme is set with the custom file `colortheme.lua`.

## Installation

### Prerequisites

Ensure you have Neovim v0.8+ installed. You can check your Neovim version with:

```bash
nvim --version
```

### 1. Install Neovim

For Linux (Debian/Ubuntu):

```bash
sudo apt install neovim
```

For macOS (with Homebrew):

```bash
brew install neovim
```

For Windows, use the Neovim installation from [Neovim's official GitHub](https://github.com/neovim/neovim/wiki/Installing-Neovim).

### 2. Clone this Repository

To set up this configuration, clone this repository into your Neovim configuration folder:

```bash
git clone https://github.com/zombocoder/nvim-config.git ~/.config/nvim
```

### 3. Install Plugins

Once `lazy.nvim` is installed, open Neovim and run the following command to install the required plugins:

```bash
:Lazy
```

This will automatically sync and install all the plugins specified in your `init.lua` and `lua/plugins/` folder.

### 4. Additional Setup

Some plugins require additional setup:

- **LSP**: Make sure to install the required language servers for your development languages. You can install servers manually or use `mason.nvim` to manage LSP servers.
- **Telescope**: Ensure `ripgrep` is installed for advanced search functionalities:

  ```bash
  sudo apt install ripgrep
  ```

- **NeoTree**: NeoTree requires `nvim-web-devicons` for file icons. Make sure they are installed and configured.

### 5. Keybindings

Custom keymaps are defined in `lua/core/keymaps.lua`. These include:

- **Telescope** for fuzzy finding.
- **NeoTree** for file explorer navigation.
- **Bufferline** for switching between open buffers.

Refer to the `keymaps.lua` file for a full list of key bindings.

### 6. Customization

Feel free to tweak the configuration by editing the files in the `lua/` directory. Each plugin has its own configuration file in `lua/plugins/`.

## Credits

This configuration is built on top of [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) and uses various plugins from the Neovim community.

This README provides a detailed overview of your Neovim setup, including installation instructions and information about plugin configuration. Let me know if you need any further adjustments!
