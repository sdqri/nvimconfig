-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- My packages:
	-- For tabs you know!
    -- These optional plugins should be loaded directly because of a bug in Packer lazy loading
    use('nvim-tree/nvim-web-devicons') -- OPTIONAL: for file icons
    use('lewis6991/gitsigns.nvim') -- OPTIONAL: for git status
    use('romgrk/barbar.nvim')

    -- todos
    use {
    "folke/todo-comments.nvim",
    requires = {{"nvim-lua/plenary.nvim"}}
    }

    -- nvimtree
    use{'nvim-tree/nvim-tree.lua'}

    -- Color scheme
    use({ 'rose-pine/neovim', as = 'rose-pine' })

    vim.cmd('colorscheme rose-pine')

    -- treesitter
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    -- undotree 
    use('mbbill/undotree')

    -- lsp-zero
    use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v1.x',
      requires = {
          -- LSP Supportresponse
          {'neovim/nvim-lspconfig'},
          {'williamboman/mason.nvim'},
          {'williamboman/mason-lspconfig.nvim'},

          -- Autocompletion
          {'hrsh7th/nvim-cmp'},
          {'hrsh7th/cmp-buffer'},
          {'hrsh7th/cmp-path'},
          {'saadparwaiz1/cmp_luasnip'},
          {'hrsh7th/cmp-nvim-lsp'},
          {'hrsh7th/cmp-nvim-lua'},

          -- Snippets
          {'L3MON4D3/LuaSnip'},
          {'rafamadriz/friendly-snippets'},
      }
    }

    -- pretty daignostics
    use({
      "folke/trouble.nvim",
      config = function()
          require("trouble").setup {
              icons = false,
              -- your configuration comes here
              -- or leave it empty to use the default settings
              -- refer to the configuration section below
          }
      end
    })

    -- testing for golang
    use 'ray-x/go.nvim'
    use 'ray-x/guihua.lua' -- recommended if need floating window support

    -- comments 
    use 'terrortylor/nvim-comment'

    -- multi-cursor
    use "mg979/vim-visual-multi"

    -- live grep for telescope
    use {
      "nvim-telescope/telescope.nvim",
      requires = {
        { "nvim-telescope/telescope-live-grep-args.nvim" },
      },
      config = function()
        require("telescope").load_extension("live_grep_args")
      end
    }

    -- folding
    use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}

    -- funs:
    use("eandrju/cellular-automaton.nvim")

end)
