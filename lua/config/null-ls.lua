local M = {}

M.setup = function()
  local null_ls = require 'null-ls'
  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics

  vim.env.PRETTIERD_DEFAULT_CONFIG = vim.fn.stdpath 'config'
    .. '/lua/config/.prettierrc.json'

  null_ls.config {
    -- you must define at least one source for the plugin to work
    sources = {
      formatting.prettierd.with {
        filetypes = {
          'typescriptreact',
          'typescript',
          'javascriptreact',
          'javascript',
          'svelte',
          'json',
          'jsonc',
          'css',
          'html',
        },
      },
      formatting.stylua.with {
        args = {
          '--config-path',
          vim.fn.stdpath 'config' .. '/lua/config/stylua.toml',
          '-',
        },
      },
    },
  }

  require('lspconfig')['null-ls'].setup {}
end

return M
