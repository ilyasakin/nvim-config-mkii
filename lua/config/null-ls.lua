require('null-ls').config {
  -- you must define at least one source for the plugin to work
  sources = {
    require('null-ls').builtins.formatting.stylua.with {
      args = {
        '--config-path',
        vim.fn.stdpath 'config' .. '/lua/config/stylua.toml',
        '-',
      },
    },
  },
}

require('lspconfig')['null-ls'].setup {}
