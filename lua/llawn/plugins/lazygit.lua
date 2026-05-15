local utils = require("llawn.utils.cmd")

local nmap_leader = utils.nmap_leader
nmap_leader("gg", "<Cmd>LazyGit<Cr>", "LazyGit")
