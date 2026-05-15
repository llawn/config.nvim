-- MiniSessions module for sesssions management
local sessions = require("mini.sessions")
local utils = require("llawn.utils.cmd")

sessions.setup()

local nmap_leader = utils.nmap_leader

local session_new = function() sessions.write(vim.fn.input("Session name: ")) end

nmap_leader('sd', function() sessions.select("delete") end, 'Delete')
nmap_leader('sn', session_new,                              'New')
nmap_leader('sr', function() sessions.select("read") end,   'Read')
nmap_leader('sw', sessions.write,                           'Write current')
