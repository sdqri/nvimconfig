local Plugin = { "supermaven-inc/supermaven-nvim" }

Plugin.opts = {
    keymaps = {
        accept_suggestion = "<Tab>",
        clear_suggestion = "<C-]>",
        accept_word = "<C-j>",
    },
    ignore_filetypes = { cpp = true }, -- or { "cpp", }
    color = {
        suggestion_color = "#ffffff",
        cterm = 244,
    },
    log_level = "info", -- set to "off" to disable logging completely
    disable_inline_completion = false, -- disables inline completion for use with cmp
    disable_keymaps = false, -- disables built-in keymaps for more manual control
    condition = function()
        return true -- Default to off
    end, -- condition to check for stopping supermaven, `true` means to stop supermaven when the condition is true.
}

function Plugin.config(_, opts)
    local supermaven = require("supermaven-nvim")
    supermaven.setup(opts)

    -- Set a shortcut to toggle Supermaven
    vim.api.nvim_set_keymap("n", "<Leader>sm", ":SupermavenToggle<CR>", { noremap = true, silent = true })
end

return Plugin
