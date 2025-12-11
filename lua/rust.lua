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
