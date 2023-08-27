local M = {}

M.general = {
  n = {
    ["<leader>q"] = { "<cmd>q<CR>"}, -- quit
    ["C-q"] = { "<cmd>q!<CR>"}, -- force quit without saving
    ["<leader>cd"] = { "<cmd>cd %:p:h<CR>"}, -- root directory

    --split window

    ["<leader>sv"] = { "<C-w>v"}, -- verticaly
    ["<leader>sh"] = { "<C-w>s"}, -- horizontaly
    ["<leader>sx"] = { ":close<CR>"}, -- close split window

    --clear highlight
    ["<leader>h"] = { "<cmd>nohlsearch<CR>"},
    --close buffer
    ["<S-q>"] = { "<cmd>Bdelete!<CR>"},
  },

  i = {
    ["jk"] = { "<ESC>", "escape vim" },
  },
}


M.treesitter = {
  n = {
    ["<leader>cu"] = { "<cmd> TSCaptureUnderCursor <CR>", "find media" },
  },
}


M.toggleterm = {
  n = {
    ["<leader>th"] = { "<cmd>ToggleTerm size=15 direction=horizontal<CR>" },
    ["<leader>tv"] = { "<cmd>ToggleTerm size=60 direction=vertical<CR>" }
  }
}

return M
