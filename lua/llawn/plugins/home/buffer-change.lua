local buffer_change = require("buffer-change")
local utils = require("llawn.utils.cmd")

local nmap_leader = utils.nmap_leader

nmap_leader("gf", buffer_change.picker.select_ref_type_and_diff, "Git Diff Current File")
