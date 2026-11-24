vim.opt.rtp:prepend("~/.config/nvim/lazy.nvim")

require("keymaps")
require("options")
require("lazy").setup(require("plugins"))
require("lualine").setup({
    options = {
        icons_enabled = true,
        theme = "ayu_dark",
    },
    sections = {
        lualine_c = {
            { "filename", path = 1 },
        },
    },
    inactive_sections = {
        lualine_c = {
            { "filename", path = 1 },
        },
    },
})
require("treesitter")
vim.cmd.colorscheme("catppuccin-mocha")
require("telescope")
require("lsp")
require("completion")
require("ibl").setup()
require("which-key").setup({})
require("flash").setup({})
require("neogit").setup({})
require("rust")
require("rust_fmt")
require("python")
