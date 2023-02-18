require "custom.plugins.overrides"
require "custom.plugins.toggleterm"

return {

  ----------------------------------------- install plugins ------------------------------------------
  ["stevearc/dressing.nvim"] = {},
  ["akinsho/toggleterm.nvim"] = {},
   --------------------------------------------- custom plugins ----------------------------------------------

  -- autoclose tags 
  ["windwp/nvim-ts-autotag"] = {
    ft = { "html", "javascriptreact", "go", "sh", "javascript", "json", "yaml" },
    after = "nvim-treesitter",
    config = function()
      local present, autotag = pcall(require, "nvim-ts-autotag")

      if present then
        autotag.setup()
      end
    end,
  },

  -- format & linting
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  -- get highlight group under cursor
  ["nvim-treesitter/playground"] = {
    cmd = "TSCaptureUnderCursor",
    config = function()
      require("nvim-treesitter.configs").setup()
    end,
  },

-- Put this in your custom plugins section i.e M.plugins field 

["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
},

["folke/which-key.nvim"] = {
    disable = false,
    module = "which-key",
    keys = { "<leader>", '"', "'", "`" },
    config = function()
      require "plugins.configs.whichkey"
    end,
    setup = function()
      require("core.utils").load_mappings "whichkey"
    end,
  },


  -- remove plugin
  ["NvChad/nvterm"] = false,


}
