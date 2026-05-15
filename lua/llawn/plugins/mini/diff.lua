-- MiniDiff module for to work with diff hunks
local diff = require("mini.diff")
local utils = require("llawn.utils.cmd")

diff.setup()

local nmap_leader = utils.nmap_leader

nmap_leader('go', diff.toggle_overlay, 'Toggle overlay')
