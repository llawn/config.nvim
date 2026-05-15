-- MiniHippaterns module to highlight patterns in text
local hipatterns = require('mini.hipatterns')
local hi_words = require('mini.extra').gen_highlighter.words

vim.api.nvim_set_hl(0, 'HipatternsTrue', { fg = '#98c379', bold = true })
vim.api.nvim_set_hl(0, 'HipatternsFalse', { fg = '#e06c75', bold = true })

hipatterns.setup({
  highlighters = {
    fixme     = hi_words({ 'FIXME', 'Fixme', 'fixme' }, 'MiniHipatternsFixme'),
    hack      = hi_words({ 'HACK' , 'Hack' , 'hack' } , 'MiniHipatternsHack'),
    todo      = hi_words({ 'TODO' , 'Todo' , 'todo' } , 'MiniHipatternsTodo'),
    note      = hi_words({ 'NOTE' , 'Note' , 'note' } , 'MiniHipatternsNote'),
    true_kw   = hi_words({ 'TRUE' , 'True' , 'true' } , 'HipatternsTrue'),
    false_kw  = hi_words({ 'FALSE', 'False', 'false' }, 'HipatternsFalse'),
    hex_color = hipatterns.gen_highlighter.hex_color(),
  },
})
