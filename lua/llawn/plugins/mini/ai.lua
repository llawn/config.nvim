-- Mini.ai module for defining and extending textobjects
local ai = require("mini.ai")
-- Mini.extra module providing additional textobjects utilities
local extra = require("mini.extra")

ai.setup({
  custom_textobjects = {
    B = extra.gen_ai_spec.buffer(),
    D = extra.gen_ai_spec.diagnostic(),
    I = extra.gen_ai_spec.indent(),
    L = extra.gen_ai_spec.line(),
    N = extra.gen_ai_spec.number(),
    F = ai.gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }),
  },
  search_method = 'cover',
})
