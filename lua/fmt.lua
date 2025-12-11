-- Enable autoformatting on save
vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(vim.lsp.get_clients()[1].id)
        if client and client.name == "rust_analyzer" then
            vim.lsp.buf.format({ bufnr = bufnr })
        end
    end,
})
