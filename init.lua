vim.opt.rtp:prepend("~/.config/nvim/lazy/lazy.nvim")

require("keymaps")
require("options")

require("lazy").setup({
    { 
		"nvim-lualine/lualine.nvim", 
		dependencies = "nvim-tree/nvim-web-devicons",
	},
    { 
		"nvim-treesitter/nvim-treesitter", 
		branch = "master", 
		lazy = false, 
		build = ":TSUpdate",
		config = require("nvimtree"),
	},
    { 
		"catppuccin/nvim", 
		name = "catppuccin",
	},
    { 
		"nvim-tree/nvim-tree.lua",
		lazy = false,
		dependencies = "nvim-tree/nvim-web-devicons",
	},
	{ 
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{ 
		"mfussenegger/nvim-lint",
		config = require("linter"),
	},
	{
		"neovim/nvim-lspconfig",
		config = require("lsp"),
	},
	{
		"folke/trouble.nvim",
		opts = {},
		cmd = "Trouble", 
		keys = {
			{
			  "<leader>rr",
			  "<cmd>Trouble diagnostics toggle win.position=right<cr>",
			  desc = "Diagnostics (Trouble)",
		  	},
		},
	},

})

require("lualine").setup({
    options = {
        icons_enabled = true,
        theme = "ayu_dark",
    }
})

require("nvim-treesitter.configs").setup({
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
})

vim.cmd.colorscheme("catppuccin-mocha")

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

