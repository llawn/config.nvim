local conform = require('conform')
local utils = require('llawn.utils.cmd')

conform.setup({
  default_format_opts = {
    -- Allow formatting from LSP server if no dedicated formatter is available
    lsp_format = 'fallback',
  },
  -- Map of filetype to formatters
  -- Make sure that necessary CLI tool is available
  -- formatters_by_ft = { lua = { 'stylua' } },
})

local nmap_leader = utils.nmap_leader
local xmap_leader = utils.xmap_leader

local formatting_cmd = function() conform.format({lsp_fallback=true}) end
nmap_leader('lf', formatting_cmd, 'Format')
xmap_leader('lf', formatting_cmd, 'Format selection')

