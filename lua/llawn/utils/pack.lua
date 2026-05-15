local M = {}

---@type vim.pack.PlugData[]
M.plugins = {}
---@type vim.pack.PlugData[]
M.unused  = {}

---Refresh the list of all plugins from vim.pack and sort by name.
function M.refresh()
  local plugins = vim.pack.get()
  table.sort(plugins, function(a,b)
    return a.spec.name < b.spec.name
  end)
  M.plugins = plugins
end

---Get cached plugin list; refreshes if empty.
---@return vim.pack.PlugData[] @list of vim.pack plugins
function M.get()
  if vim.tbl_isempty(M.plugins) then
    M.refresh()
  end
  return M.plugins
end

---Refresh the list of inactive (unused) plugins.
function M.refresh_unused()
  local plugins = M.get()
  local unused = {}
  for _, p in ipairs(plugins) do
    if not p.active then
      table.insert(unused, p)
    end
  end
  M.unused = unused
end

---Get cached unused plugins; refreshes if empty.
---@return vim.pack.PlugData[]
function M.get_unused()
  if vim.tbl_isempty(M.unused) then
    M.refresh_unused()
  end
  return M.unused
end

---Update a single plugin by name.
---@param name string
function M.update(name)
  vim.pack.update({ name })
end

---Update all plugins.
function M.update_all()
  vim.pack.update()
end

---Prompt to confirm and delete a plugin by name.
---@param name string
function M.delete(name)
  vim.ui.select({ "No", "Yes" }, {
    prompt = "Delete " .. name .. "?",
  }, function(choice)
    if choice == "Yes" then
      vim.pack.del({ name })
      vim.notify("Deleted " .. name)
      M.refresh()
    end
  end)
end

---Load a plugin by name (packadd).
---@param name string
function M.load(name)
  vim.cmd.packadd(name)
end

return M
