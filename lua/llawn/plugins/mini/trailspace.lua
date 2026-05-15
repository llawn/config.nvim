-- MiniTrailspace module to highlight and remove trailspace
local trailspace = require("mini.trailspace")
local utils = require("llawn.utils.cmd")

trailspace.setup()
local nmap_leader = utils.nmap_leader

nmap_leader('ot', trailspace.trim, 'Trim trailspace')
