return function()
  local function custom_on_attach(bufnr)
    local api = require("nvim-tree.api")
    api.config.mappings.default_on_attach(bufnr)
    vim.keymap.del("n", "f", { buffer = bufnr })
    vim.keymap.set("n", "gf", api.live_filter.start, { buffer = bufnr, desc = "nvim-tree: Live Filter" })
  end

  -- Requires nerd fonts in .local/share/fonts/*.ttl
  require("nvim-tree").setup({
    on_attach = custom_on_attach,
    renderer = {
      icons = {
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = true,
        },
      }
    },
  })
end
