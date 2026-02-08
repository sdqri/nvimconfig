local Plugins = {
    { "tpope/vim-fugitive" },
    { "mg979/vim-visual-multi" },
    { "tpope/vim-surround" },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "nvim-lua/plenary.nvim", branch = "master" },
        },
        build = "make tiktoken",
        opts = {
            -- See Configuration section for options
        },
    },
}

return Plugins
