local nnoremap = vim.keymap.nnoremap

local provider_module = require 'lspsaga.provider'
local code_action_module = require 'lspsaga.codeaction'
local hover_module = require 'lspsaga.hover'
local action_module = require 'lspsaga.action'
local signature_help_module = require 'lspsaga.signaturehelp'

nnoremap {
  'gh',
  provider_module.lsp_finder,
  { silent = true },
}

nnoremap {
  '<leader>ca',
  code_action_module.code_action,
  { silent = true },
}

nnoremap {
  'K',
  hover_module.render_hover_doc,
  { silent = true },
}

nnoremap {
  '<C-f>',
  function()
    action_module.smart_scroll_with_saga(1)
  end,
  { silent = true },
}

nnoremap {
  '<C-b>',
  function()
    action_module.smart_scroll_with_saga(-1)
  end,
  { silent = true },
}

nnoremap {
  'gs',
  signature_help_module.signature_help,
  { silent = true },
}
