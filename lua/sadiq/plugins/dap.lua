local Plugin = { "mfussenegger/nvim-dap" }

Plugin.dependencies = {
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
        },
    },
    { "leoluz/nvim-dap-go" },
}

Plugin.event = { "BufReadPre", "BufNewFile" }

function Plugin.config()
    local dapui = require("dapui")
    local dapgo = require("dap-go")

    dapui.setup()

    dapgo.setup({
        dap_go = {
            delve = {
                initialize_timeout_sec = 20,
                port = "${port}",
            },
            dap_configurations = {
                {
                    type = "go",
                    name = "Attach remote",
                    mode = "remote",
                    request = "attach",
                },
            },
        },
    })

    -- Set keymaps for debugging controls
    vim.keymap.set("n", "<leader>dc", '<cmd>lua require"dap".continue()<CR>', { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>dr", '<cmd>lua require"dap".rerun()<CR>', { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>b", '<cmd>lua require"dap".toggle_breakpoint()<CR>', { noremap = true, silent = true })
    vim.keymap.set(
        "n",
        "<leader>wa",
        '<cmd>lua require("dapui").elements.watches.add()<CR>',
        { noremap = true, silent = true }
    )
    vim.keymap.set(
        "n",
        "<leader>wr",
        '<cmd>lua require("dapui").elements.watches.remove()<CR>',
        { noremap = true, silent = true }
    )
    vim.keymap.set(
        "n",
        "<leader>wc",
        '<cmd>lua require("dapui").elements.watches.clear()<CR>',
        { noremap = true, silent = true }
    )
    vim.keymap.set("n", "<leader>dt", '<cmd>lua require("dapui").toggle()<CR>', { noremap = true, silent = true })
end

return Plugin
