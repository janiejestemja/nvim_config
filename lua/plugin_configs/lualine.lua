return function()
  require("lualine").setup({
      options = {
          icons_enabled = true,
          theme = "ayu_dark",
      },
      sections = {
          lualine_c = {
              { "filename", path = 1 },
          },
      },
      inactive_sections = {
          lualine_c = {
              { "filename", path = 1 },
          },
      },
  })
end
