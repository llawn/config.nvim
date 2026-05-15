-- MiniSnippets module to manage and expand snippets
local snippets = require("mini.snippets")

local config_path = vim.fn.stdpath("config")

-- Define language patterns to work better with 'friendly-snippets'
local latex_patterns = { "latex/**/*.json", "**/latex.json" }
local lang_patterns = {
  tex = latex_patterns,
  plaintex = latex_patterns,
  -- Recognize special injected language of markdown tree-sitter parser
  markdown_inline = { "markdown.json" },
}

snippets.setup({
  snippets = {
    -- Load 'snippets/global.json' from config directory
    snippets.gen_loader.from_file(config_path .. "/snippets/global.json"),
    -- Load from 'snippets/' directory of plugins, like 'friendly-snippets'
    snippets.gen_loader.from_lang({ lang_patterns = lang_patterns }),
  },
  mappings = {
    expand_or_jump = "<C-j>",
    next_tabstop = "<C-l>",
    previous_tabstop = "<C-h>",
    force_end = "<C-c>",
  },
})

-- Uncomment to show snippets as candidates in completion menu:
snippets.start_lsp_server()
