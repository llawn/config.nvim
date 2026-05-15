-- MiniNotify module to show notifications
local notify = require("mini.notify")
local utils = require("llawn.utils.cmd")

notify.setup()

local nmap_leader = utils.nmap_leader

nmap_leader('en', notify.show_history, 'Notifications')
