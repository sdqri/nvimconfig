-- empty setup using defaults
require("nvim-tree").setup()

vim.keymap.set("n", "<leader>et", "<cmd>:NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>ee", "<cmd>:NvimTreeFocus<CR>")
vim.keymap.set("n", "<leader>ef", "<cmd>:NvimTreeFindFile<CR>")
vim.keymap.set("n", "<leader>ec", "<cmd>:NvimTreeCollapse<CR>")
