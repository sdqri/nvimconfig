local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

-- Add live_grep
vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

-- Add find buffers
vim.keymap.set("n", "<leader>fb", builtin.buffers)

-- Add find help
vim.keymap.set("n", "<leader>fh", builtin.help_tags)
