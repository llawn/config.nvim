-- MiniFiles modules to navigate and manipulate file system
local files = require("mini.files")
local utils = require("llawn.utils.cmd")

files.setup({
  options = { use_as_default_explorer = false },
  windows = { preview = true },
})

local nmap_leader = utils.nmap_leader
local explore_at_file = function() files.open(vim.api.nvim_buf_get_name(0)) end

nmap_leader('eD', files.open , 'Directory (Mini)')
nmap_leader('ef', explore_at_file , 'File directory (Mini)')
