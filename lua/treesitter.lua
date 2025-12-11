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


