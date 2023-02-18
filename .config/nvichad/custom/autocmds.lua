local autocmd = vim.api.nvim_create_autocmd

autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.ejs" },
  callback = function()
    vim.cmd "set filetype=html"
  end,
})

autocmd({ "FileType" }, {
  pattern = { "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})
