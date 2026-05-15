-- MiniBufremove module for buffer removing
local bufremove = require("mini.bufremove")
local utils = require("llawn.utils.cmd")

bufremove.setup()

local nmap_leader = utils.nmap_leader

local new_scratch_buffer = function()
  vim.api.nvim_win_set_buf(0, vim.api.nvim_create_buf(true, true))
end

nmap_leader('ba', function() vim.cmd('b#') end             , 'Alternate')
nmap_leader('bd', bufremove.delete                         , 'Delete')
nmap_leader('bD', function() bufremove.delete(0 , true) end, 'Delete!')
nmap_leader('bs', new_scratch_buffer                       , 'Scratch')
nmap_leader('bw', bufremove.wipeout                        , 'Wipeout')
nmap_leader('bW', function() bufremove.wipeout(0, true) end, 'Wipeout!')
