# llawn.nvim

A Neovim configuration built on [`vim.pack`](https://neovim.io/doc/user/repeat.html#vim.pack) and the [`mini.nvim`](https://github.com/nvim-mini/mini.nvim) ecosystem.

## Features

- **Native plugin management** -- Uses Neovim 0.12+ `vim.pack`
- **mini.nvim core** -- Built around 30+ mini plugins
- **Language support**:
    - LSP via `vim.lsp.enable()`
    - Treesitter **WITHOUT** archived [`nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter)
    -  Manual installation of language servers and treesitter parsers and queries
- **Keyboard-driven** -- `<Space>` leader with organized bindings
- **Rose Pine Moon** -- Transparent colorscheme with Nerd Font icons and custom highlights
- **Git integration** -- LazyGit, mini.diff
- **Yazi file manager** -- Replaces netrw for directory navigation
- **Atone undo tree** -- Visual undo history exploration
- **Pack-utils** -- Personal plugin management UI for `vim.pack`

## Requirements

- Neovim >= 0.12
- Git
- Nerd Font
- `lazygit`, `yazi`
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

Formatter support via `conform.nvim` (LSP fallback)
Treesitter parsers for Go, Python, and Rust.

## Installation

Clone the repository and symlink to your Neovim config directory:

```bash
git clone git@github.com:llawn/nvim.git ~/.config/nvim
```

## Related

- [`mini.nvim`](https://github.com/nvim-mini/mini.nvim) -- Library of 30+ plugins used throughout this config
- [`pack-utils.nvim`](https://github.com/llawn/pack-utils.nvim) -- My UI for `vim.pack`
