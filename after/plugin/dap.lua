local dap_highlight_augroup = vim.api.nvim_create_augroup("dap_highlight", { clear = true })

vim.api.nvim_create_autocmd("VimEnter", {
    group = dap_highlight_augroup,
    callback = function()
        local LineNrBGColor = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("LineNr")), "bg"):gsub("\n", "")
        vim.cmd(string.format("highlight DapBreakpoint guifg=#ff0000 guibg=%s", LineNrBGColor))
        vim.cmd(string.format("highlight DapBreakpointCondition guifg=#00ff00 guibg=%s", LineNrBGColor))
        vim.cmd(string.format("highlight DapBreakpointRejected guifg=#ff0000 guibg=%s", LineNrBGColor))
        vim.cmd(string.format("highlight DapStopped guifg=#0000ff guibg=%s", LineNrBGColor))

        -- Customize the sign for breakpoints
        vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint" })
        vim.fn.sign_define("DapBreakpointCondition", { text = "◆", texthl = "DapBreakpointCondition" })
        vim.fn.sign_define("DapBreakpointRejected", { text = "✘", texthl = "DapBreakpointRejected" })
        vim.fn.sign_define("DapStopped", { text = "▶", texthl = "DapStopped", linehl = "DapStoppedLine" })
    end,
})
