local Plugin = {
    "github/copilot.vim",
    enabled = false, -- disable to prevent conflicts with Supermaven
}

function Plugin.config()
    -- Start enabled (optional)
    vim.g.copilot_enabled = true

    -- Disable default <Tab> mapping
    vim.g.copilot_no_tab_map = true

    -- Accept with <C-l> to avoid conflicts with other shortcuts
    vim.keymap.set("i", "<C-l>", 'copilot#Accept("<CR>")', {
        expr = true,
        silent = true,
        noremap = true,
        replace_keycodes = false,
    })

    -- Auto suggestions
    vim.g.copilot_auto_trigger = true

    --------------------------------------------------------------
    -- Copilot ON / OFF / TOGGLE shortcuts
    --------------------------------------------------------------
    local map = vim.keymap.set

    -- Enable Copilot
    map("n", "<leader>ce", function()
        vim.g.copilot_enabled = true
        print(" Copilot enabled")
    end, { silent = true, desc = "Copilot Enable" })

    -- Disable Copilot
    map("n", "<leader>cd", function()
        vim.g.copilot_enabled = false
        print(" Copilot disabled")
    end, { silent = true, desc = "Copilot Disable" })

    -- Toggle Copilot
    map("n", "<leader>ct", function()
        vim.g.copilot_enabled = not vim.g.copilot_enabled
        if vim.g.copilot_enabled then
            print(" Copilot enabled")
        else
            print(" Copilot disabled")
        end
    end, { silent = true, desc = "Copilot Toggle" })
end

return Plugin
