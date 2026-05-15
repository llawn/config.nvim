local utils = require("llawn.utils.cmd")

local nmap_leader = utils.nmap_leader

nmap_leader("pp", function() vim.cmd('PackUI') end, "Open plugin manager")
nmap_leader("px", function() vim.cmd('PackDelUnused') end, "Delete inactive plugins")
