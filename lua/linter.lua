return function()
    local lint = require("lint")

    lint.linters_by_ft = {
        -- dnf install python3-flake8
        python = { "flake8" },
        cpp = { "cppcheck" },
    }

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
            lint.try_lint()
        end,
    })
end
