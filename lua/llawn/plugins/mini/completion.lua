-- MiniCompletion module for completion and signature help
local completion = require('mini.completion')

---Custom processing function
---@param items table[]
---@param base string
---@return table Array
local process_items = function(items, base)
  local process_items_opts = { kind_priority = { Text = -1, Snippet = 99 } }
  return completion.default_process_items(items, base, process_items_opts)
end

completion.setup({
  lsp_completion = {
    source_func = 'omnifunc',
    auto_setup = false,
    process_items = process_items,
  },
})


local set_omnifunc_for_lsp = function(ev)
  vim.bo[ev.buf].omnifunc = 'v:lua.MiniCompletion.completefunc_lsp'
end

vim.api.nvim_create_autocmd('LspAttach', {
  callback = set_omnifunc_for_lsp,
  desc = "Set 'omnifunc' for LSP completion",
})

vim.lsp.config('*', { capabilities = completion.get_lsp_capabilities() })
