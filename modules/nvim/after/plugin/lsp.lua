local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd('LspAttach', {
  group = augroup('LspAttachGroup', {
    clear = true
  }),
  callback = function(event)
    local map = function(keys, func)
      vim.keymap.set('n', keys, func, {
        buffer = event.buf
      })
    end

    local lsp = vim.lsp.buf
    map('K', lsp.hover)
    map('gd', lsp.definition)
    map('gD', lsp.declaration)
    map('gr', lsp.references)
    map('gI', lsp.implementation)

    map('<leader>D', lsp.type_definition)
    map('<leader>ds', lsp.document_symbol)
    map('<leader>ws', lsp.workspace_symbol)
    map('<leader>rn', lsp.rename)
    map('<leader>ca', lsp.code_action)

    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.server_capabilities.documentHighlightProvider then
      autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        callback = vim.lsp.buf.document_highlight,
      })

      autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        callback = vim.lsp.buf.clear_references,
      })
    end
  end,
})
