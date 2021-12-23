local M = {}

function M.attach_node()
  local dap = require 'dap'

  print 'attaching'
  dap.run {
    type = 'node2',
    request = 'attach',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    skipFiles = { '<node_internals>/**/*.js' },
  }
end

return M
