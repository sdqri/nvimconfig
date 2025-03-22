local Plugin = {'nvim-treesitter/nvim-treesitter'}

Plugin.main = 'nvim-treesitter.configs'

Plugin.dependencies = {
  {'nvim-treesitter/nvim-treesitter-textobjects'}
}

Plugin.build = ':TSUpdate'

-- See :help nvim-treesitter-modules
Plugin.opts = {
  auto_install = true,

  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false
  },

  -- :help nvim-treesitter-textobjects-modules
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      }
    },
  },

  ensure_installed = {
    'lua',
    'vim',
    'vimdoc',
    'json',
    'c',
    'python',
    'go',
    'javascript',
    'typescript',
    'zig',
  },
}

return Plugin

