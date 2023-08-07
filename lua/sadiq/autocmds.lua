-----------------------------------------------------------
-- Autocommand functions
-----------------------------------------------------------

-- Define autocommands with Lua APIs
-- See: h:api-autocmd, h:augroup

--local augroup = vim.api.nvim_create_augroup   -- Create/get autocommand group
--local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand

-- General settings:
--------------------

-- Remove whitespace on save
--autocmd("BufWritePre",{
--    group = augroup("onwrite", {clear = true}),
--    pattern = "*.go",
--    command = "silent % !gofumpt %"
--    })

-- Run gofmt + goimport on save

local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimport()
  end,
  group = format_sync_grp,
})

