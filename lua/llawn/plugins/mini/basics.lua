-- MiniBasics module for common configuration presets
local basics = require("mini.basics")

basics.setup({
  -- Options are manually set in config/options.lua
  options = { basic = false },
  mappings = {
    basic = true,
    option_toggle_prefix = [[\]],
    windows = false,
    move_with_alt = false,
  },
  autocommands = {
    basic = true,
    relnum_in_visual_mode = false,
  },

  -- Whether to disable showing non-error feedback
  silent = false,
})
