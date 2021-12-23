local M = {}

local which_key = require 'which-key'

M.setup = function()
  which_key.setup {}
end

M.post = function()
  which_key.register({
    b = { name = 'buffer' },
    f = { name = 'file', t = 'File Tree' },
    e = { name = 'editor' },
    h = { name = 'git hunk' },
    c = { name = 'code actions' },
    d = { name = 'debug', a = { name = 'attach' } },
  }, { prefix = '<leader>' })

  which_key.register({
    b = {
      p = { '<cmd>bp<CR>', 'Previous Buffer' },
      n = { '<cmd>bn<CR>', 'Next Buffer' },
    },
  }, { prefix = '<leader>' })
end

return M
