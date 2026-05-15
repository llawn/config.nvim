-- MiniMisc module for miscellaneous functions
local misc = require('mini.misc')
local utils = require('llawn.utils.cmd')

misc.setup()

local nmap_leader = utils.nmap_leader

nmap_leader('or', misc.resize_window, 'Resize to default width')
nmap_leader('oz', misc.zoom,          'Zoom toggle')

misc.setup_auto_root()
misc.setup_restore_cursor()
misc.setup_termbg_sync()

