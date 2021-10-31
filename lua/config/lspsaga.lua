local nnoremap = vim.keymap.nnoremap

nnoremap {
  'gh',
  require('lspsaga.provider').lsp_finder,
  { silent = true },
}

nnoremap {
  '<leader>ca',
  require('lspsaga.codeaction').code_action,
  { silent = true },
}

nnoremap {
  'K',
  require('lspsaga.hover').render_hover_doc,
  { silent = true },
}

nnoremap {
  '<C-f>',
  function() require('lspsaga.action').smart_scroll_with_saga(1) end,
  { silent = true },
}

nnoremap {
  '<C-b>',
  function() require('lspsaga.action').smart_scroll_with_saga(-1) end,
  { silent = true },
}
