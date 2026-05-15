# llawn.nvim

A Neovim configuration built on [`vim.pack`](https://neovim.io/doc/user/repeat.html#vim.pack) and the [`mini.nvim`](https://github.com/nvim-mini/mini.nvim) ecosystem.
Heavely inspired by [`MiniMax`](https://nvim-mini.org/MiniMax/)

## Installation

Clone the repository and symlink to your Neovim config directory:

```bash
git clone git@github.com:llawn/nvim.git ~/.config/nvim
```:

## Features

- **Plugin management** -- Neovim 0.12+ `vim.pack` with [`pack-utils.nvim`](https://github.com/llawn/pack-utils.nvim) UI
- **[`mini.nvim`](https://github.com/nvim)** -- 30+ mini plugins
- **Language support**:
    - LSP via built-in `vim.lsp` and ['nvim-lspconfig'](https://github.com/neovim/nvim-lspconfig)
    - Formatting with ['conform'](https://github.com/stevearc/conform.nvim)
    - Treesitter via built-in `vim.treesitter` **WITHOUT** archived [`nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter)
    - :warning: Needs manual installation of language servers and treesitter parsers and queries
- **Keyboard-driven** -- Organized bindings with descriptions
- **Colorscheme** -- Transparent ['Rose Pine Moon'](https://github.com/rose-pine/neovim)** with Nerd Font icons and custom highlights
- **Git integration** -- ['LazyGit'](https://github.com/kdheepak/lazygit.nvim) and mini.git
- **File manager** -- ['Yazi'](https://github.com/mikavilpas/yazi.nvim) Replaces netrw for directory navigation
- **Undo tree** -- ['Atone'](https://github.com/XXiaoA/atone.nvim) undo history exploration

## Requirements

- Neovim >= 0.12
- Git
- Nerd Font
- `lazygit`, `yazi`, `tree-sitter`
- language servers
- treesitter parsers and queries

## Language Servers

| Language | Server |
|---|---|
| Go | `gopls` |
| Rust | `rust-analyzer` |
| Python | `ty` |
| Lua | `lua_ls` |
| Dart/Flutter | `flutter_ls` (`analysis_server.dart.snapshot`) |

Community configs for Nvim LSP with ['nvim-lspconfig'](https://github.com/neovim/nvim-lspconfig) 
Formatter support via ['conform'](https://github.com/stevearc/conform.nvim)
 (LSP fallback)
Treesitter parsers and queries for non-native language: Go, Python, and Rust
