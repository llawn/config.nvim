local library = {
  vim.env.VIMRUNTIME,
  vim.api.nvim_get_runtime_file("lua/lspconfig", false)[1],
  '${3rd}/luv/library',
}

for _, plugin in ipairs(vim.pack.get()) do
  if plugin.active then
    local lua_dir = plugin.path .. '/lua'
    if vim.uv.fs_stat(lua_dir) then
      table.insert(library, lua_dir)
    end
  end
end

--- @type vim.lsp.Config
return {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if
        path ~= vim.fn.stdpath('config')
        and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
      then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        version = 'LuaJIT',
        path = {
          'lua/?.lua',
          'lua/?/init.lua',
        },
      },
      workspace = {
        checkThirdParty = false,
        library = library,
      },
      telemetry = {
        enable = false,
      },
    })
  end,
}

