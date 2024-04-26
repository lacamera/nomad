require('conform').setup {
  notify_on_error = false,
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
  formatters_by_ft = {
    go = { 'gofmt', 'goimports' },
    -- lua = { 'stylua' },
    -- Run *until* a formatter is found
    javascript = { { 'prettierd', 'prettier' } },
  }
}
