local M = {}

function M.post()
  local wk = require 'which-key'

  wk.register {
    d = {
      b = {
        "<cmd>lua require 'dap'.toggle_breakpoint()<CR>",
        'Toggle Breakpoint',
      },
    },
  }
end

return M
