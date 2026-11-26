-- Classic vim
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.cursorline = true
vim.opt.mouse = ""
vim.opt.signcolumn= "auto:2"
vim.o.winborder = "rounded"
vim.opt.termguicolors = true

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "<filetype>" },
  callback = function() vim.treesitter.start() end,
})
