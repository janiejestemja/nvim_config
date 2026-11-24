-- requires ty (commonly installed via uv)
vim.lsp.config("ty", {
  cmd = { vim.fn.expand("~/.local/bin/ty"), "server" },
  settings = {
    ty = {
      -- ty language server settings go here
    },
  },
})

-- Required: This actually enables the language server
vim.lsp.enable("ty")
