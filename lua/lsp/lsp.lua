-- LSP keymaps on attach
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then return end 

    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { buffer = bufnr })
    vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, { buffer = bufnr })
    vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { buffer = bufnr })
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr })
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })

    vim.lsp.inlay_hint.enable(true, {bufnr = args.buf})
  end,
})
