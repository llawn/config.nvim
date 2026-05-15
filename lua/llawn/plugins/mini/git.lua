-- MiniGit module for git integration
local git = require("mini.git")
local utils = require("llawn.utils.cmd")

git.setup()

local nmap_leader = utils.nmap_leader
local xmap_leader = utils.xmap_leader

nmap_leader('gs', git.show_at_cursor,  'Show at cursor')
xmap_leader('gs', git.show_at_cursor, 'Show at selection')
