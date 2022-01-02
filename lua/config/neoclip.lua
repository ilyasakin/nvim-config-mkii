local M = {}

function M.setup()
  local neoclip = require 'neoclip'
  neoclip.setup {
    enable_persistant_history = true,
  }
end

function M.post()
  local which_key = require 'which-key'
  which_key.register({
    e = {
      c = {

        '<cmd>Telescope neoclip plus<CR>',
        'Open Clipboard',
      },
    },
  }, { prefix = '<leader>' })
end

return M
