local Plugin = { "stevearc/conform.nvim" }

Plugin.event = { "BufReadPre", "BufNewFile" }

Plugin.opts = {
    formatters_by_ft = {
        lua = { "stylua" },
    },
    format_on_save = {
        lsp_format = "fallback",
        timeout_ms = 500,
    },

    -- Set the log level. Use `:ConformInfo` to see the location of the log file.
    log_level = vim.log.levels.ERROR,
    -- Conform will notify you when a formatter errors
    notify_on_error = true,
    -- Conform will notify you when no formatters are available for the buffer
    notify_no_formatters = true,
}

function Plugin.config(_, opts)
    require("conform").setup(opts)

    -- Set keymap for normal and visual mode
    vim.keymap.set({ "n", "v" }, "<leader>f", function()
        -- Call the conform format function
        require("conform").format({ async = false })
    end, { desc = "Format the current buffer or selected range" })
end

return Plugin
