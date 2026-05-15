local mini_plugins = require("llawn.utils.mini").mini_plugins

---Supported git forges and their base repository URLs.
---Keys are short forge identifiers, values are repository URL prefixes.
---@type table<string, string>
local forges = {
  gh = 'https://github.com/',
  cb = 'https://codeberg.org/',
  gl = 'https://gitlab.com/',
  mini = 'https://github.com/nvim-mini/mini.',
  me = 'https://github.com/llawn/', -- my plugins
}

---Build a full repository URL from a shorthand package path.
---
--- Examples:
---   "gh:user/repo"   -> "https://github.com/user/repo"
---   "cb:user/repo"   -> "https://codeberg.org/user/repo"
---   "user/repo"      -> Uses GitHub by default
---
---@param path string #Package shorthand or repository path.
---@return string url #Fully qualified repository URL.
local function pkg(path)
  local prefix, repo = path:match("^(%w+):(.+)$")
  return (forges[prefix] or forges.gh) .. (repo or path)
end

---Additional third-party plugins.
---@type string[]
local plugins = {
  'kdheepak/lazygit.nvim', --  git
  'mikavilpas/yazi.nvim', -- file navigation
  'rafamadriz/friendly-snippets', -- default language snippets
  'rose-pine/neovim', -- colorscheme for neovim

  -- mine
  'me:pack-utils.nvim',
}

---Shared plugin dependencies
---@type string[]
local deps = {
  'nvim-lua/plenary.nvim' -- yazi, lazygit
}

local specs = {}

for name, opts in pairs(mini_plugins) do
  -- Skip if the value is boolean false
  local is_enabled = opts ~= false
  if is_enabled then
    -- The mini-git package is mini-git and not mini.git
    local repo_name = (name == "git") and "nvim-mini/mini-git" or "mini:" .. name
    table.insert(specs, { src = pkg(repo_name) })
  end
end

for _, path in ipairs(deps) do
  table.insert(specs, { src = pkg(path) })
end

for _, path in ipairs(plugins) do
  table.insert(specs, { src = pkg(path) })
end

vim.pack.add(specs)

require("llawn.plugins")
