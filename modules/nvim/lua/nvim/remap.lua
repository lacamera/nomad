vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {})
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {})
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, {})
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, {})

-- vim.keymap.set('n', '<left>', '')
-- vim.keymap.set('n', '<right>', '')
-- vim.keymap.set('n', '<up>', '')
-- vim.keymap.set('n', '<down>', '')

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', {})
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', {})
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', {})
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', {})
