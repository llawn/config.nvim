local cfg = require('llawn.utils.mini').mini_plugins

---Needs of a specific configuration for mini_plugins
---@type table<string,boolean>
local advanced_setup = {
  -- Text editing
  ai           = true,  -- Extends and create (a/i) textobjects
  align        = false, -- Align text interactively
  comment      = false, -- Comment lines
  completion   = true,  -- Completion and signature help
  keymap       = true,  -- Special key mappings
  move         = false, -- Move any selection in any direction
  operators    = false, -- Text edit operators
  pairs        = false, -- Autopairs
  snippets     = true,  -- Manage and expand snippets
  splitjoin    = false, -- Split and join arguments
  surround     = false, -- Surround actions
  -- General workflow
  basics       = true,  -- Common configuration presets
  bracketed    = false, -- Go forward/backward with square brackets
  bufremove    = true,  -- Remove buffers
  clue         = true,  -- Show next key clues
  cmdline      = false, -- Command line tweaks
  deps         = false, -- Plugin Manager -> vim.pack
  diff         = true,  -- Work with diff hunks -> mini.diff
  extra        = false, -- `mini.pick` + `mini.ai` + `mini.hipatterns` extra
  files        = true,  -- Navigate and manipulate file system
  git          = true,  -- Git integration
  jump         = false, -- Jump to next/previous single character
  jump2d       = false, -- Jump within visible lines
  misc         = true,  -- Miscellaneous functions
  pick         = true,  -- Pick anything
  sessions     = true,  -- Session management
  visits       = true,  -- Track and reuse file system visits
  -- Appearance
  animate      = false, -- Animate common Neovim actions
  base16       = false, -- Base16 colorscheme creation
  colors       = false, -- Tweak and save any colorscheme
  cursorword   = false, -- Autohighlight word under cursor
  hipatterns   = true,  -- Highlights patterns in text
  hues         = false, -- Generate configurable colorscheme
  icons        = false, -- Icon provider
  indentscope  = false, -- Visualize and work with indentscope
  map          = true,  -- Window with buffer text overview
  notify       = true,  -- Show notifications
  starter      = false, -- Start screen
  statusline   = false, -- Statusline
  tabline      = false, -- Tabline
  trailspace   = true,  -- Trailspace (highligh and remove)
  -- Other
  doc          = false, -- Generate Neovim help files
  fuzzy        = false, -- Fuzzy matching
  test         = false,
}

-- setup "simple" mini_plugins
for name, enabled in pairs(cfg) do
  if enabled ~= false and not advanced_setup[name] then
    require('mini.' .. name).setup()
  end
end

-- Load per-plugin custom setups
for name, enabled in pairs(advanced_setup) do
  if cfg[name] ~= false and enabled ~= false then
    local ok = pcall(require, 'llawn.plugins.mini.' .. name)
    if not ok then
      vim.notify('Failed to load mini plugin config: ' .. name, vim.log.levels.WARN)
    end
  end
end
