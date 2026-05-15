local atone = require("atone")
local utils = require("llawn.utils.cmd")

atone.setup({
  layout = { direction = "right" },
})

local nmap_leader = utils.nmap_leader

nmap_leader('cu', '<Cmd>Atone<CR>', 'UndoTree')
