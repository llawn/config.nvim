vim.g.have_nerd_font = true
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Netrw is kept minimal since it is replaced by yazi
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- Query
vim.g.query_lint_on = { 'BufEnter', 'BufWrite', 'InsertLeave', }
