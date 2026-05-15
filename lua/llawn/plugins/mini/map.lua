-- MiniMap module for text overview
local map = require('mini.map')
local utils = require('llawn.utils.cmd')

map.setup({
  symbols = {
    encode = map.gen_encode_symbols.dot('4x2'),
  },
  integrations = {
    map.gen_integration.builtin_search(),
    map.gen_integration.diff(),
    map.gen_integration.diagnostic(),
  },
})

local nmap_leader = utils.nmap_leader
nmap_leader('mf', map.toggle_focus, 'Focus (toggle)')
nmap_leader('mr', map.refresh     , 'Refresh')
nmap_leader('ms', map.toggle_side , 'Side (toggle)')
nmap_leader('mt', map.toggle      , 'Toggle')
