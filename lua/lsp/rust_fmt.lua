-- lua/fmt.lua
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.rs",
  callback = function(args)
    -- set vim.g.disable_rust_format = 1 to disable
    if vim.g.disable_rust_format then return end

    local clients = vim.lsp.get_clients({
      bufnr = args.buf,
      name = "rust_analyzer",
    })

    if #clients > 0 then
      vim.lsp.buf.format({ bufnr = args.buf })
    end
  end,
})
vim.g.disable_rust_format = nil
