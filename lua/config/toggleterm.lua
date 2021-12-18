local M = {}

M.setup = function()
  require('toggleterm').setup {
    direction = 'float',
  }
end

M.post = function()
  local wk = require 'which-key'

  wk.register({
    t = {
      name = 'terminal',
      t = { '<cmd>ToggleTerm<CR>', 'Toggle Terminal' },
    },
  }, { prefix = '<leader>' })
end

return M
