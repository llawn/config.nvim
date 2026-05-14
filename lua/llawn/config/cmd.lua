local utils = require('llawn.utils.cmd')

vim.api.nvim_create_user_command('CopyMessages', utils.copy_messages, {})
vim.api.nvim_create_user_command('ToggleList', utils.toggle_listchars, {})
