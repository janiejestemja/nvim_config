-- Mapping keys
vim.g.mapleader = "f"

-- Map y to z and z to y

-- NvimTree
vim.api.nvim_set_keymap("n", "<leader>uu", ":NvimTreeOpen<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>ui", ":NvimTreeClose<CR>", {noremap = true, silent = true})

-- Terminal
vim.api.nvim_set_keymap("n", "<leader>tt", ":belowright split | resize 11 | terminal<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("t", "<Esc>", [[<C-\><C-n>]], {noremap = true})

-- Linter
vim.keymap.set("n", "<leader>re", vim.diagnostic.open_float)

-- Bufferline
vim.keymap.set("n", "<leader>gt", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>gT", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<leader>bp", "<cmd>BufferLineTogglePin<cr>", { desc = "Pin Buffer" })
vim.keymap.set("n", "<leader>bb", "<cmd>BufferLinePick<cr>", { desc = "Pick Buffer" })
