vim.opt.rtp:prepend("~/.config/nvim/lazy.nvim")

require("opts.keymaps")
require("opts.options")
require("lazy").setup(require("plugins"))
require("plugin_configs.lualine")()
require("plugin_configs.cattpuccin")()
require("plugin_configs.treesitter")()
require("plugin_configs.telescope")()
require("lsp.lsp")
require("lsp.completion")
require("ibl").setup()
require("which-key").setup({})
require("flash").setup({})
require("neogit").setup({})
require("lsp.rust")
require("lsp.rust_fmt")
-- require("lsp.python")

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "<filetype>" },
  callback = function() vim.treesitter.start() end,
})
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo.foldmethod = "expr"
-- vim.opt.foldlevel = 99
