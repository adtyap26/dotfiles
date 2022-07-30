local M = {}
local pluginConfs = require "custom.plugins.configs"

M.ui = {
   -- hl = highlights
   hl_add = {},
   hl_override = {},
   changed_themes = {},
   theme_toggle = { "onedark", "one_light" },
   theme = "tokyonight", -- default theme
   transparency = false,
}

M.plugins = {
   override = {
      ["nvim-treesitter/nvim-treesitter"] = pluginConfs.treesitter,
      ["kyazdani42/nvim-tree.lua"] = pluginConfs.nvimtree,
      ["NvChad/nvim-colorizer.lua"] = pluginConfs.colorizer,
      ["neovim/nvim-lspconfig"] = {
            config = function()
            require "plugins.configs.lspconfig"
            require "custom.plugins.lspconfig"
      end,
      },
      ["williamboman/mason.nvim"] = pluginConfs.mason,
   },
   user = {
      ["goolord/alpha-nvim"] = {
         disable = false,
      },
   },
}
return M
