local M = {}

M.setup = function()
  local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

  parser_configs.norg = {
    install_info = {
      url = 'https://github.com/nvim-neorg/tree-sitter-norg',
      files = { 'src/parser.c', 'src/scanner.cc' },
      branch = 'main',
    },
  }

  parser_configs.norg_meta = {
    install_info = {
      url = 'https://github.com/nvim-neorg/tree-sitter-norg-meta',
      files = { 'src/parser.c' },
      branch = 'main',
    },
  }

  parser_configs.norg_table = {
    install_info = {
      url = 'https://github.com/nvim-neorg/tree-sitter-norg-table',
      files = { 'src/parser.c' },
      branch = 'main',
    },
  }

  require('nvim-treesitter.configs').setup {
    highlight = {
      enable = true,
      disable = { 'css', 'scss' },
    },
    rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = nil,
    },
    indent = {
      enable = false,
      disable = {},
    },
    ensure_installed = {
      'bash',
      'c',
      'c_sharp',
      'cmake',
      'cpp',
      'css',
      'dockerfile',
      'fish',
      'go',
      'html',
      'javascript',
      'jsdoc',
      'json',
      'json5',
      'lua',
      'php',
      'python',
      'rust',
      'scss',
      'svelte',
      'toml',
      'tsx',
      'typescript',
      'vim',
      'vue',
      'yaml',
      'prisma',
      'markdown',
      'norg',
      'norg_meta',
      'norg_table',
    },
  }
end

M.post = function()
  local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
  parser_config.tsx.used_by = { 'javascript', 'typescript.tsx' }
end

return M
