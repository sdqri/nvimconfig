return {
    "mbbill/undotree",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
        {
            "<leader>u",
            vim.cmd.UndotreeToggle,
            desc = "Toggle UndoTree",
        },
    },
}
