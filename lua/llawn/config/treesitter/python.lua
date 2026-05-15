local cmd = require("llawn.utils.cmd")

local parser_dir  = cmd.parser_root .. "/tree-sitter-python"
local parser_path = parser_dir .. "/python.so"
local queries_dir = parser_dir .. "/queries"

local uv = vim.uv or vim.loop

local function exists(path)
  return uv.fs_stat(path) ~= nil
end

local function setup_python_parser()
  if not (exists(parser_dir) and exists(parser_path)) then
    vim.notify("Custom Python parser not found", vim.log.levels.WARN)
    return
  end

  -- Register parser
  vim.treesitter.language.add("python", {
    path = parser_path,
  })

  -- Add custom queries directory
  if exists(queries_dir) then
    vim.opt.runtimepath:append(parser_dir)
  else
    vim.notify("Custom Python treesitter queries not found, using defaults", vim.log.levels.WARN)
  end
end

setup_python_parser()

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function(args)
    pcall(vim.treesitter.start, args.buf, "python")
  end,
})
