vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>")
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  {silent = true, noremap = true}
  )
