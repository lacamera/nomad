require 'nvim.remap'
require 'nvim.options'

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require 'nvim.lazy'

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = augroup('HighlightYank', {
    clear = true,
  }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
