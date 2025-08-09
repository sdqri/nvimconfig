-- vim.api.nvim_set_keymap("n", "<leader>lf", ":!npx eslint --fix %<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>lf", function()
    local filename = vim.fn.expand("%:p")
    local cmd = "npx eslint --config ~/src/main/eslint.config.js " .. filename .. " --fix"
    vim.cmd("! " .. cmd)
    vim.cmd("edit!") -- reload buffer
end, { desc = "Run ESLint fix on current file" })
