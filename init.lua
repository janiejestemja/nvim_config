vim.opt.rtp:prepend("~/.config/nvim/lazy.nvim")

require("keymaps")
require("options")
require("lazy").setup(require("plugins"))
require("lualine").setup({
    options = {
        icons_enabled = true,
        theme = "ayu_dark",
    }
})
require("treesitter")
vim.cmd.colorscheme("catppuccin-mocha")
require("telescope")
require("lsp")
require("rust")
require("fmt")
require("completion")
