return function()
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
                ["<leader>of"] = "@function.outer",
                ["<leader>if"] = "@function.inner",

                ["<leader>oc"] = "@class.outer",
                ["<leader>ic"] = "@class.inner",

                ["<leader>op"] = "@parameter.outer",
                ["<leader>ip"] = "@parameter.inner",
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
end
