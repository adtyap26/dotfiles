-- custom/plugins/configs.lua file

local M = {}

M.treesitter = {
   ensure_installed = {
      "lua",
      "html",
      "css",
      "javascript",
      "python",
      "lua",
   },
}

M.nvimtree = {
   git = {
      enable = true,
   },
   view = {
      side = "right",
      width = 20,
   },
}

-- we use a function here as we are calling a moodule (cmp)
-- so the function needs to return a table!
M.cmp = function()
   local cmp = require 'cmp' 

   return {
       ["<C-d>"] = cmp.mapping.scroll_docs(-8),
    }
end

return M
