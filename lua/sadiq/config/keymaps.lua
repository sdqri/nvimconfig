-- Space as leader key
vim.g.mapleader = " "

-- remove into blackhole register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- remove into blackhole and paste
vim.keymap.set("x", "<leader>p", [["_dP]])

-- replace current word
vim.keymap.set("v", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- source current file
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- moving
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- change to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- move lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- center cursor when scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Disable the default behavior of Q in normal mode (Ex mode)
vim.keymap.set("n", "Q", "<nop>")

-- open window in new tab (zoom)
vim.keymap.set("n", "<leader>z", "<cmd>tabedit %<CR>")
