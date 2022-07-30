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

M.colorizer = {
   filetypes = {
         "*",
      },
      user_default_options = {
         RGB = true, -- #RGB hex codes
         RRGGBB = true, -- #RRGGBB hex codes
         names = true, -- "Name" codes like Blue
         RRGGBBAA = true, -- #RRGGBBAA hex codes
         rgb_fn = false, -- CSS rgb() and rgba() functions
         hsl_fn = false, -- CSS hsl() and hsla() functions
         css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
         css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
         mode = "background", -- Set the display mode.
   },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "emmet-ls",
    "json-lsp",

    -- shell
    "shfmt",
    "shellcheck",
  },
}


-- we use a function here as we are calling a moodule (cmp)
-- so the function needs to return a table!


return M
