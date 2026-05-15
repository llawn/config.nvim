local M        = {}

---@type table<string, boolean>
M.mini_plugins = {
  -- Text Editing
  ai           = true,  -- Extends and create (a/i) textobjects
  align        = true,  -- Align text interactively
  comment      = true,  -- Comment lines
  completion   = true,  -- Completion and signature help
  keymap       = true,  -- Special key mappings
  move         = true,  -- Move any selection in any direction
  operators    = true,  -- Text edit operators
  pairs        = true,  -- Autopairs
  snippets     = true,  -- Manage and expand snippets
  splitjoin    = true,  -- Split and join arguments
  surround     = true,  -- Surround actions
  -- General Workflow
  basics       = true,  -- Common configuration presets
  bracketed    = true,  -- Go forward/backward with square brackets
  bufremove    = true,  -- Remove buffers
  clue         = true,  -- Show next key clues
  cmdline      = true,  -- Command line tweaks
  deps         = false, -- Plugin Manager -> vim.pack 
  diff         = true,  -- Work with diff hunks -> mini.diff
  extra        = true,  -- `mini.pick` + `mini.ai` + `mini.hipatterns` extra
  files        = true,  -- Navigate and manipulate file system
  git          = true,  -- Git integration
  jump         = true,  -- Jump to next/previous single character
  jump2d       = true,  -- Jump within visible lines
  misc         = true,  -- Miscellaneous functions
  pick         = true,  -- Pick anything
  sessions     = true,  -- Session management
  visits       = true,  -- Track and reuse file system visits
  -- Appearance
  animate      = true,  -- Animate common Neovim actions
  base16       = false, -- Base16 colorscheme creation
  colors       = false, -- Tweak and save any colorscheme
  cursorword   = true,  -- Autohighlight word under cursor
  hipatterns   = true,  -- Highlights patterns in text
  hues         = false, -- Generate configurable colorscheme
  icons        = true,  -- Icon provider
  indentscope  = true,  -- Visualize and work with indentscope
  map          = false, -- Window with buffer text overview
  notify       = true,  -- Show notifications
  starter      = true,  -- Start screen
  statusline   = true,  -- Statusline
  tabline      = false, -- Tabline
  trailspace   = true,  -- Trailspace (highligh and remove)
  -- Other
  doc          = false, -- Generate Neovim help files
  fuzzy        = true,  -- Fuzzy matching
  test         = false, -- Text Neovim plugins
}

return M
