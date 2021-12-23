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
      h = { "<cmd>lua require 'dap'.step_over()<CR>", 'Step Over' },
      j = { "<cmd>lua require 'dap'.step_into()<CR>", 'Step Into' },
      k = { "<cmd>lua require 'dap'.step_out()<CR>", 'Step Out' },
      l = { "<cmd>lua require 'dap'.continue()<CR>", 'Continue' },
      ['?'] = {
        '<cmd>lua local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes)<CR>',
        'Scopes',
      },
      K = { '<cmd>require"dap.ui.widgets".hover()<CR>', 'Hover' },
    },
  }, { prefix = '<leader>' })

  vim.fn.sign_define(
    'DapBreakpoint',
    { text = '📍', texthl = '', linehl = '', numhl = '' }
  )
end

return M
