local Plugin = { "mfussenegger/nvim-lint" }

Plugin.event = { "BufReadPre", "BufNewFile" }

Plugin.opts = {
    formatters_by_ft = {
        lua = { "luacheck" },
        typescript = { "eslint" },
    },
}

function Plugin.config(_, opts)
    local lint = require("lint")

    -- Apply the formatters_by_ft options
    lint.linters_by_ft = opts.formatters_by_ft

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

    -- 👇 I added this for detecting which linter current buffer uses
    vim.api.nvim_create_user_command("ShowLinter", function()
        local ft = vim.bo.filetype
        local linters = lint.linters_by_ft[ft]
        if linters then
            print("Linter(s) for " .. ft .. ": " .. table.concat(linters, ", "))
        else
            print("No linter configured for filetype: " .. ft)
        end
    end, {})
end

return Plugin
