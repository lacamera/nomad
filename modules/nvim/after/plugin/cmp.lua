local cmp = require 'cmp'

cmp.setup {
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },

  -- :help ins-completion
  mapping = cmp.mapping.preset.insert {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm { select = true },
    ['<C-Space>'] = cmp.mapping.complete {},
  },

  sources = {
    { name = 'nvim_lsp' },
    { name = 'path' },
  },
}
