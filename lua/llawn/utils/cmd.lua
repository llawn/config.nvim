local M = {}

M.parser_root = vim.fn.expand("$HOME") .. "/.local/share/tree-sitter"

M.copy_messages = function()
  local msgs = vim.fn.execute('messages')
  vim.fn.setreg('+', msgs)
  vim.notify('Messages copy to clipboard', vim.log.levels.INFO)
end

M.edit_config_file = function(filename)
  return string.format('<Cmd>edit %s/lua/llawn/%s<CR>', vim.fn.stdpath('config'), filename)
end

M.explore_quickfix = function()
  for _, win_id in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    if vim.fn.getwininfo(win_id)[1].quickfix == 1 then return vim.cmd('cclose') end
  end
  vim.cmd('copen')
end

M.nmap_leader = function(suffix, rhs, desc)
  vim.keymap.set('n', '<Leader>' .. suffix, rhs, { desc = desc })
end

M.toggle_listchars = function()
  vim.wo.list = not vim.wo.list
end

M.xmap_leader = function(suffix, rhs, desc)
  vim.keymap.set('x', '<Leader>' .. suffix, rhs, { desc = desc })
end

return M
