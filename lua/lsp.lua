return function()
    require("lspconfig").rust_analyzer.setup({
        settings = {
            cargo = {
                allFeatures = true,
            },
            check = {
                command = "clippy",
            },
            inlayHints = {
                typeHints = true,
                parameterHints = true,
                chainingHints = true,
            },
        },
    })
end
