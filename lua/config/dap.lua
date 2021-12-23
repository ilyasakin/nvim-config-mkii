local M = {}

function M.post()
  local wk = require 'which-key'

  wk.register({
    d = {
      b = {
        "<cmd>lua require 'dap'.toggle_breakpoint()<CR>",
        'Toggle Breakpoint',
      },
      a = {
        n = {
          "<cmd>lua require 'scripts.dap'.attach_node()<CR>",
          'Attach Node',
        },
      },
    },
  }, { prefix = '<leader>' })

  vim.fn.sign_define(
    'DapBreakpoint',
    { text = '📍', texthl = '', linehl = '', numhl = '' }
  )
end

return M
