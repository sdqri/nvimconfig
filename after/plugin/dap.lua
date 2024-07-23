local dap = require('dap')
local dapui = require("dapui")
dapui.setup()

require('dap-go').setup {
    -- delve configurations
    delve = {
        -- time to wait for delve to initialize the debug session.
        -- default to 20 seconds
        initialize_timeout_sec = 20,
        -- a string that defines the port to start delve debugger.
        -- default to string "${port}" which instructs nvim-dap
        -- to start the process in a random available port
        port = "${port}"
    },
    dap_configurations = {
        {
            type = "go",
            name = "Attach remote",
            mode = "remote",
            request = "attach",
        },
    },
}

vim.keymap.set({ 'n'}, '<leader>dc', '<cmd>lua require"dap".continue()<CR>', { noremap = true, silent = true })
vim.keymap.set({ 'n'}, '<leader>dr', '<cmd>lua require"dap".rerun()<CR>', { noremap = true, silent = true })
-- vim.keymap.set({ 'n', "i" }, '<leader>dso', '<cmd>lua require"dap".step_over()<CR>', { noremap = true, silent = true })
-- vim.keymap.set({ 'n', "i" }, '<leader>dsi', '<cmd>lua require"dap".step_into()<CR>', { noremap = true, silent = true })
-- vim.keymap.set({ 'n', "i" }, '<leader>dso', '<cmd>lua require"dap".step_out()<CR>', { noremap = true, silent = true })
vim.keymap.set({ 'n'}, '<leader>b', '<cmd>lua require"dap".toggle_breakpoint()<CR>',
    { noremap = true, silent = true })
vim.keymap.set({ 'n'}, '<leader>wa', '<cmd>lua require("dapui").elements.watches.add()<CR>',
    { noremap = true, silent = true })
vim.keymap.set({ 'n'}, '<leader>wr', '<cmd>lua require("dapui").elements.watches.remove()<CR>',
    { noremap = true, silent = true })
vim.keymap.set({ 'n'}, '<leader>wc', '<cmd>lua require("dapui").elements.watches.clear()<CR>',
    { noremap = true, silent = true })
vim.keymap.set({ 'n'}, '<leader>dt', '<cmd>lua require("dapui").toggle()<CR>', { noremap = true, silent = true })

function SetDebuggerHighlihgts()
    local LineNrBGColor = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID('LineNr')), 'bg')
    LineNrBGColor = string.gsub(LineNrBGColor, "\n", "")
    vim.cmd(string.format("highlight DapBreakpoint guifg=#ff0000 guibg=%s", LineNrBGColor))
    vim.cmd(string.format("highlight DapBreakpointCondition guifg=#00ff00 guibg=%s", LineNrBGColor))
    vim.cmd(string.format("highlight DapBreakpointRejected guifg=#ff0000 guibg=%s", LineNrBGColor))
    vim.cmd(string.format("highlight DapStopped guifg=#0000ff guibg=%s", LineNrBGColor))

    -- Customize the sign for breakpoints
    vim.fn.sign_define('DapBreakpoint', { text = '●', texthl = 'DapBreakpoint' })
    vim.fn.sign_define('DapBreakpointCondition',
        { text = '◆', texthl = 'DapBreakpointCondition', linehl = '', numhl = '' })
    vim.fn.sign_define('DapBreakpointRejected', { text = '✘', texthl = 'DapBreakpointRejected', linehl = '', numhl = '' })
    vim.fn.sign_define('DapStopped', { text = '▶', texthl = 'DapStopped', linehl = 'DapStoppedLine', numhl = '' })
end

vim.cmd("autocmd VimEnter * lua SetDebuggerHighlihgts()")
