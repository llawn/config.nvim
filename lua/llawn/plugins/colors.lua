local rose_pine = require("rose-pine")

---@type table<string, string>
local colors = {
  nontext = "#9eb9d4",
  whitespace = "#ed7a9b",
  specialkey = "#e9d66b",
  endofbuffer = "#708090",
}

-- Configures the colorscheme with transparent background
--- @param color string|nil
local function SetupColorScheme(color)
  color = color or "rose-pine-moon"

  -- Transparent background
  vim.cmd.colorscheme(color)
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

  -- Customize visibility of normally invisible characters
  vim.api.nvim_set_hl(0, "NonText", { fg = colors.nontext, bold = true })
  vim.api.nvim_set_hl(0, "Whitespace", { fg = colors.whitespace, italic = true })
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = colors.specialkey, bold = true })
  vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = colors.endofbuffer })
end

rose_pine.setup({
  variant = "moon",
  dark_variant = "moon",

  styles = {
    bold = true,
    italic = false,
    transparency = true,
  },
})

SetupColorScheme();
