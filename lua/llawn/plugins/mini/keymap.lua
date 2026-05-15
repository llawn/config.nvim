-- MiniKeymap module for special key mapping
local keymap = require("mini.keymap")

keymap.setup()

-- Navigate 'mini.completion' menu with `<Tab>` /  `<S-Tab>`
keymap.map_multistep('i', '<Tab>'  , { 'pmenu_next' })
keymap.map_multistep('i', '<S-Tab>', { 'pmenu_prev' })
-- On `<CR>` try to accept current completion item, fall back to accounting
-- for pairs from 'mini.pairs'
keymap.map_multistep('i', '<CR>'   , { 'pmenu_accept', 'minipairs_cr' })
-- On `<BS>` just try to account for pairs from 'mini.pairs'
keymap.map_multistep('i', '<BS>'   , { 'minipairs_bs' })
