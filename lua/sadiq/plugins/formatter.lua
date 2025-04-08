local Plugin = { "stevearc/conform.nvim" }

Plugin.event = { "BufReadPre", "BufNewFile", "BufWritePre" }

Plugin.opts = {
    formatters_by_ft = {
        lua = { "stylua" },
        go = { "gofmt" },
        javascript = { "prettier" },
        typescript = { "prettier" },
    },

    format_on_save = {
        lsp_format = "fallback",
        timeout_ms = 500,
    },

    -- Set the log level. Use `:ConformInfo` to see the location of the log file.
    log_level = vim.log.levels.TRACE,
    -- Conform will notify you when a formatter errors
    notify_on_error = true,
    -- Conform will notify you when no formatters are available for the buffer
    notify_no_formatters = true,
    -- Custom formatters and overrides for built-in formatters

    -- Custom formatters and overrides for built-in formatters
    formatters = {
        global_prettier = {
            command = "sh",
            args = {
                "-c",
                [[
                        output=$(prettier "$1" 2>&1)
                        code=$?
                        echo "$output"
                        exit $code
                        ]],
                "--",
                "$FILENAME",
            },
            exit_codes = { 0 },
            condition = function(_, ctx)
                return vim.fn.filereadable(ctx.filename) == 1
            end,
            env = false,
            inherit = false,
        },
    },
}

function Plugin.config(_, opts)
    require("conform").setup(opts)

    -- Set keymap for normal and visual mode
    vim.keymap.set({ "n", "v" }, "<leader>f", function()
        -- Call the conform format function
        require("conform").format({ async = true })
    end, { desc = "Format the current buffer or selected range" })
end

return Plugin
