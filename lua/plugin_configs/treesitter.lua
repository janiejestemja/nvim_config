return function()
  require("nvim-treesitter-textobjects").setup({
    select = {
      enable = true,
      lookahead = true,
    },
    move = {
      enable = true,
      set_jumps = true,
    },
    swap = {
      enable = true,
    },
  })

  -- Then manually bind keys
  local select = require("nvim-treesitter-textobjects.select")
  local move = require("nvim-treesitter-textobjects.move")
  local swap = require("nvim-treesitter-textobjects.swap")

  -- select
  -- vim.keymap.set({"x", "o"}, "<leader>of", function()
  --   select.select_textobject("@function.outer", "textobjects")
  -- end)
  -- vim.keymap.set({"x", "o"}, "<leader>if", function()
  --  select.select_textobject("@function.inner", "textobjects")
  --end)
  -- ... Other select keybindings follow the same pattern

  -- move inner
  vim.keymap.set({"n", "x", "o"}, "<leader>nf", function()
    move.goto_next_start("@function.inner", "textobjects")
  end)
  vim.keymap.set({"n", "x", "o"}, "<leader>nc", function()
    move.goto_next_start("@class.inner", "textobjects")
  end)
  vim.keymap.set({"n", "x", "o"}, "<leader>np", function()
    move.goto_next_start("@parameter.inner", "textobjects")
  end)

  -- move outer
  vim.keymap.set({"n", "x", "o"}, "<leader>pf", function()
    move.goto_previous_start("@function.outer", "textobjects")
  end)
  vim.keymap.set({"n", "x", "o"}, "<leader>pc", function()
    move.goto_previous_start("@class.outer", "textobjects")
  end)
  vim.keymap.set({"n", "x", "o"}, "<leader>pp", function()
    move.goto_previous_start("@parameter.outer", "textobjects")
  end)
  -- ... Other move keybindings follow the same pattern

  -- swap
  vim.keymap.set("n", "<leader>sn", function()
    swap.swap_next("@parameter.inner")
  end)
  vim.keymap.set("n", "<leader>sp", function()
    swap.swap_previous("@parameter.inner")
  end)
end
