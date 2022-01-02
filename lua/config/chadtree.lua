local M = {}

function M.setup()
  local which_key = require 'which-key'
  which_key.register({
    f = {
      t = { '<cmd>CHADopen<CR>', 'File Tree' },
    },
  }, { prefix = '<leader>' })
end

return M
