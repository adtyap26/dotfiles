local M = {}
local pluginConfs = require "custom.plugins.configs"

M.ui = {
   -- hl = highlights
   hl_add = {},
   hl_override = {},
   changed_themes = {},
   theme_toggle = { "onedark", "one_light" },
   theme = 'chadracula', -- default theme
   transparency = false,
}

M.plugins = {
   override = {
      ["nvim-treesitter/nvim-treesitter"] = pluginConfs.treesitter,
      ["kyazdani42/nvim-tree.lua"] = pluginConfs.nvimtree,
      ["NvChad/ui"] = {
                        statusline = {
                        separator_style = "default",
                        overriden_modules = function()
                        return require "custom.plugins.sline"
                        end,
   },
},
   },
   user = {
      ["goolord/alpha-nvim"] = {
         disable = false,
      },
   },
}

return M
