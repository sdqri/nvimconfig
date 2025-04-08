local Plugin = { "hrsh7th/nvim-cmp" }

Plugin.dependencies = {
    -- Completion sources
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    -- Add lazydev.nvim as a dependency
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },

    -- Snippet engine
    { "L3MON4D3/LuaSnip" },
    { "saadparwaiz1/cmp_luasnip" },

    -- supermaven
    { "supermaven-inc/supermaven-nvim" },
}

Plugin.event = "InsertEnter" -- defines the event that triggers the loading of a plugin

function Plugin.config()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    local select_opts = { behavior = cmp.SelectBehavior.Select }

    local opts = {
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body) -- Expand snippet using LuaSnip
            end,
        },
        sources = {
            { name = "path" },
            { name = "nvim_lsp" },
            { name = "buffer", keyword_length = 3 },
            { name = "luasnip", keyword_length = 2 },
            { name = "lazydev" },
            { name = "supermaven" },
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        -- See :help cmp-mapping
        mapping = {
            ["<Up>"] = cmp.mapping.select_prev_item(select_opts),
            ["<Down>"] = cmp.mapping.select_next_item(select_opts),

            ["<C-p>"] = cmp.mapping.select_prev_item(select_opts),
            ["<C-n>"] = cmp.mapping.select_next_item(select_opts),

            ["<C-u>"] = cmp.mapping.scroll_docs(-4),
            ["<C-d>"] = cmp.mapping.scroll_docs(4),

            ["<C-e>"] = cmp.mapping.abort(),
            ["<C-y>"] = cmp.mapping.confirm({ select = true }),
            ["<CR>"] = cmp.mapping.confirm({ select = false }),

            ["<S-Tab>"] = cmp.mapping.select_prev_item(select_opts),

            -- ["<Tab>"] = cmp.mapping(function(fallback)
            --     if cmp.visible() then
            --         cmp.select_next_item(select_opts)
            --     elseif luasnip.expand_or_jumpable() then
            --         luasnip.expand_or_jump()
            --     else
            --         fallback()
            --     end
            -- end, { "i", "s" }),
        },
    }

    cmp.setup(opts)
end

return Plugin
