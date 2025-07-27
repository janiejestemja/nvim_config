return function()
	-- Requires nerd fonts in .local/share/fonts/*.ttl
	require("nvim-tree").setup({
		renderer = {
			icons = {
				show = {
					file = true,
					folder = true,
					folder_arrow = true,
					git = true,
				},
			}
		}
	})
end
