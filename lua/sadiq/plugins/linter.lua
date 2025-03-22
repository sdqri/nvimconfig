local Plugin = { "mfussenegger/nvim-lint" }

Plugin.event = { "BufReadPre", "BufNewFile" }

Plugin.opts = {
    formatters_by_ft = {
        lua = { "luacheck" },
    },
}

function Plugin.config(_, opts)
    local lint = require("lint")

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
            lint.try_lint()
        end,
    })

    vim.keymap.set("n", "<leader>l", function()
        lint.try_lint()
    end, { desc = "Trigger linting for current file" })
end

return Plugin
