local M = {}

M.setup = function()
  require('telescope').setup {
    defaults = {
      file_ignore_patterns = { 'node_modules', 'dist' },
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = 'smart_case',
      },
    },
  }
end
M.post = function()
  local which_key = require 'which-key'

  which_key.register(
    { f = { d = { '<cmd>Telescope git_files<cr>', 'Find Documents' } } },
    { prefix = '<leader>' }
  )
end

return M
