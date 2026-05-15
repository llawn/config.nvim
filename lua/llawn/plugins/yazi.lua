local yazi = require('yazi')
local utils = require('llawn.utils.cmd')

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

yazi.setup({
  floating_window_scaling_factor = 1.0,
  yazi_floating_window_border = "none",
  yazi_floating_window_winblend = 0,
  yazi_floating_window_zindex = 50,

  open_for_directories = true,
  file_filter = function(_)
    return true
  end,
  keymaps = {
    show_help = "<f1>",
  },
})


vim.api.nvim_create_user_command('Ex', 'Yazi', {})

local nmap_leader = utils.nmap_leader

nmap_leader('ed', '<Cmd>Yazi cwd<CR>', 'Directory')
nmap_leader('ee', '<Cmd>Yazi<CR>', 'File directory')
