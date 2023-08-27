local M = {}


M.ui = {
  -- hl = highlights
  hl_add = {},
  hl_override = {},
  changed_themes = {},
  theme_toggle = { "tokyonight", "one_light" },
  theme = "tokyonight", -- default theme
  transparency = false,
}

M.plugins = require("custom.plugins")

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
