-- Mapping keys
vim.g.mapleader = "?"

-- NvimTree
vim.api.nvim_set_keymap("n", "<leader>to", ":NvimTreeOpen<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>tc", ":NvimTreeClose<CR>", {noremap = true, silent = true})

-- Terminal
vim.api.nvim_set_keymap("n", "<leader>tt", ":belowright split | resize 11 | terminal<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("t", "<Esc>", [[<C-\><C-n>]], {noremap = true})

-- Linter
vim.keymap.set("n", "<leader>ee", vim.diagnostic.open_float)

