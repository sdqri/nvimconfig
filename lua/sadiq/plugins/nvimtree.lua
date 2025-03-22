local Plugin = { "nvim-tree/nvim-tree.lua" }

Plugin.dependencies = {
    { "nvim-tree/nvim-web-devicons" },
}

Plugin.keys = {
    { "<leader>et", "<cmd>:NvimTreeToggle<CR>", desc = "Toggle Nvim Tree" },
    { "<leader>ee", "<cmd>:NvimTreeFocus<CR>", desc = "Focus Nvim Tree" },
    { "<leader>ef", "<cmd>:NvimTreeFindFile<CR>", desc = "Find File in Nvim Tree" },
    { "<leader>ec", "<cmd>:NvimTreeCollapse<CR>", desc = "Collapse Nvim Tree" },
}

function Plugin.config(_, opts)
    require("nvim-tree").setup(opts)
end

return Plugin
