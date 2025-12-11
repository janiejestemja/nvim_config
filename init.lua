vim.opt.rtp:prepend("~/.config/nvim/lazy.nvim")

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
        config = function()
            require("gitsigns").setup({
                signs = {
                    add = { text = "+" },
                    change = { text = "~" },
                    delete = { text = "_" },
                    topdelete = { text = "‾" },
                    changedelete = { text = "~" },
                },
            })
        end,
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

  textobjects = {
      select = {
          enable = true,
          lookahead = true, --jumps to next relevant object

          keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",

              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",

              ["ap"] = "@parameter.outer",
              ["ip"] = "@parameter.inner",
          },
      },
      move = {
          enable = true,
          set_jumps = true,

          goto_next_start = {
              ["<leader>nf"] = "@function.inner",
              ["<leader>nc"] = "@class.inner",
              ["<leader>np"] = "@parameter.inner",
          },
          goto_previous_start = {
              ["<leader>pf"] = "@function.outer",
              ["<leader>pc"] = "@class.outer",
              ["<leader>pp"] = "@parameter.outer",
          },
      },
      swap = {
          enable = true,
          swap_next = {
              ["<leader>sn"] = "@parameter.inner",
          },
          swap_previous = {
              ["<leader>sp"] = "@parameter.inner",
          },
      },
  },
})

vim.cmd.colorscheme("catppuccin-mocha")

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

-- LSP keymaps on attach
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then return end 

    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr })
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr })
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })

    vim.lsp.inlay_hint.enable(true, {bufnr = args.buf})
  end,
})

-- Configure rust-analyzer
vim.lsp.config("rust_analyzer", {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  settings = {
    ["rust-analyzer"] = {
      cargo = { targetDir = true },
      check = { command = "clippy" },
      inlayHints = {
        bindingModeHints = { enabled = true },
        closureCaptureHints = { enabled = true },
        closureReturnTypeHints = { enable = "always" },
        maxLength = 100,
      },
      rustc = { source = "discover" },
    },
  },
})

local has_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if has_cmp then
  local caps = vim.lsp.protocol.make_client_capabilities()
  caps = cmp_lsp.default_capabilities(caps)
  vim.lsp.config["rust_analyzer"].capabilities = caps
end

-- Enable it globally
vim.lsp.enable("rust_analyzer")

-- Enable autoformatting on save
vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(vim.lsp.get_active_clients()[1].id)
        if client and client.name == "rust_analyzer" then
            vim.lsp.buf.format({ bufnr = bufnr })
        end
    end,
})

require("completion")
