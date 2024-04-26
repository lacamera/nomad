local path = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
local repo = 'https://github.com/folke/lazy.nvim.git'

if not vim.loop.fs_stat(path) then
  vim.fn.system { 'git', 'clone',
    '--filter=blob:none', '--branch=stable', repo, path }
end

vim.opt.rtp:prepend(path)

require('lazy').setup {
  { 'stevearc/conform.nvim' },
  {
    'numToStr/Comment.nvim',
    lazy = false,
    opts = {}
  },
  {
    'nvim-telescope/telescope.nvim',
    event = 'VeryLazy',
    dependencies = {
      'nvim-telescope/telescope-ui-select.nvim',
      'nvim-tree/nvim-web-devicons',
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
  },

  { -- LSP and related tools
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
    },
  },

  { -- Completion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
    },
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },

  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.ai').setup()
      require('mini.surround').setup()
      require('mini.statusline').setup()
    end,
  },

  { -- Coloscheme
    'tjdevries/gruvbuddy.nvim',
    dependencies = { 'tjdevries/colorbuddy.nvim' },
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd.colorscheme 'gruvbuddy'
    end,
  },
}
