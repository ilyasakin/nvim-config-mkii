local M = {}

M.setup = function()
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
    },
  }
end

M.post = function()
  local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
  parser_config.tsx.used_by = { 'javascript', 'typescript.tsx' }
end

return M
