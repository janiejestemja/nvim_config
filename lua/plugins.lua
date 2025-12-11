return {
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
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
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
        "folke/trouble.nvim",
        opts = {},
        cmd = "Trouble", 
        keys = {
            {
              "<leader>rr",
              "<cmd>Trouble diagnostics toggle win.position=right<cr>",
              desc = "Diagnostics (Trouble)",
            },
            {
              "<leader>rs",
              "<cmd>Trouble symbols toggle focus=false<cr>",
              desc = "Symbols (Trouble)",
            },
        },
    },
    {
      "hrsh7th/nvim-cmp",
      dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
      },
    },
    {
        "lewis6991/gitsigns.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = require("gitsignscfg")
    },
}
