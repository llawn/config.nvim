local M = {}
local pack = require("llawn.utils.pack")


---Open an interactive floating window to manage plugins.
function M.open_ui()
  -- Get plugins
  pack.refresh()
  local plugins = pack.get()

  -- Create buffer
  local buf = vim.api.nvim_create_buf(false, true)
  vim.bo[buf].bufhidden = "wipe"

  ---Helper: fomat a line given a plugin
  ---@param p vim.pack.PlugData
  ---@return string #formatted line with plugin active status, name and revision
  local function format_line(p)
    local icon = p.active and "●" or "○"
    local name = p.spec.name
    return string.format("%s %-40s [%s]", icon, name, p.rev:sub(1, 7))
  end

  ---Fill buffer with lines
  local function render()
    local lines = {}
    for _, p in ipairs(plugins) do
      table.insert(lines, format_line(p))
    end
    table.insert(lines, "")
    table.insert(lines, "[q]uit | [u]pdate | [U]pdate all | [d]elete | [l]oad | [r]efresh")
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
    vim.bo[buf].modifiable = false
  end

  render()

  -- Open floating window
  local width = math.floor(vim.o.columns * 0.7)
  local height = math.min(#plugins + 3, math.floor(vim.o.lines * 0.7))

  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    col = (vim.o.columns - width) / 2,
    row = (vim.o.lines - height) / 2,
    border = "rounded",
  })

  ---Helper: get plugin under cursor
  ---@return vim.pack.PlugData
  local function current()
    local line = vim.fn.line(".")
    return plugins[line]
  end

  -- Keymaps
  local opts = { noremap = true, silent = true, buffer = buf }

  opts.desc = "Quit vim.pack UI"
  vim.keymap.set("n", "q", function()
    vim.api.nvim_win_close(win, true)
  end, opts)

  opts.desc = "Update current line plugin"
  vim.keymap.set("n", "u", function()
    local p = current()
    if p then pack.update(p.spec.name) end
  end, opts)

  opts.desc = "Update all plugins"
  vim.keymap.set("n", "U", function()
    pack.update_all()
  end, opts)

  opts.desc = "Delete current line plugin"
  vim.keymap.set("n", "d", function()
    local p = current()
    if p then pack.delete(p.spec.name) end
  end, opts)

  opts.desc = "Load current line plugin"
  vim.keymap.set("n", "l", function()
    local p = current()
    if p then pack.load(p.spec.name) end
  end, opts)

  opts.desc = "Refresh vim.pack UI"
  vim.keymap.set("n", "r", function()
    M.open_ui()
  end, opts)
end

--- Open a floating window to select and delete unused plugins.
function M.del_unused()
  -- Get unused plugins
  pack.refresh()
  pack.refresh_unused()
  local unused = pack.get_unused()

  if vim.tbl_isempty(unused) then
    vim.notify("No unused plugins")
    return
  end

  -- Create buffer
  local buf = vim.api.nvim_create_buf(false, true)
  vim.bo[buf].bufhidden = "wipe"
  vim.bo[buf].modifiable = false
  local selected = {}

  ---Helper: fill buffer with lines
  local function render()
    local lines = {}
    for i, p in ipairs(unused) do
      local mark = selected[i] and "●" or "○"
      table.insert(lines, string.format("%s %s [%s]", mark, p.spec.name, p.rev:sub(1, 7)))
    end
    table.insert(lines, "")
    table.insert(lines, "[d]elete | [t]oggle | [T]oggle all | [q]uit")
    vim.api.nvim_set_option_value("modifiable", true, { buf = buf })
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
    vim.api.nvim_set_option_value("modifiable", false, { buf = buf })
  end

  render()

  -- Open floating window
  local width = math.floor(vim.o.columns * 0.7)
  local height = #unused + 3
  local row = (vim.o.lines - height) / 2

  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    col = (vim.o.columns - width) / 2,
    row = row,
    border = "rounded",
  })

  -- Keymaps
  local opts = { noremap = true, silent = true, buffer = buf }

  opts.desc = "Toggle current line unused plugin selection state"
  vim.keymap.set("n", "t", function()
    local idx = vim.fn.line(".")
    if idx <= #unused then
      selected[idx] = not selected[idx]
      render()
    end
  end, opts)

  opts.desc = "Select all unused plugins"
  vim.keymap.set("n", "T", function()
    local all_selected = vim.tbl_count(selected) == #unused
    if all_selected then
      selected = {}
    else
      for i = 1, #unused do selected[i] = true end
    end
    render()
  end, opts)

  ---Helper: function for the "d" keymap
  local function delete_selected()
    local plugins_selected = {}
    for i, p in ipairs(unused) do
      if selected[i] then table.insert(selected, p.spec.name) end
    end
    if vim.tbl_isempty(plugins_selected) then
      vim.notify("No plugins selected")
      return
    end
    vim.ui.select(
      { "No", "Yes" },
      { prompt = string.format("Delete %d plugin(s)?", #plugins_selected), },
      function(choice)
        if choice == "Yes" then
          vim.pack.del(plugins_selected)
          vim.notify("Deleted " .. #plugins_selected .. " plugin(s)")
        end
        vim.api.nvim_win_close(win, true)
      end
    )
  end

  opts.desc = "Delete selected plugins"
  vim.keymap.set("n", "d", delete_selected, opts)

  opts.desc = "Quit vim.pack UI"
  vim.keymap.set("n", "q", function()
    vim.api.nvim_win_close(win, true)
  end, opts)

end

return M
