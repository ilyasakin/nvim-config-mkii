local M = {}

function M.setup()
  require('dap-install').setup()

  local dap_install = require 'dap-install'
  local dbg_list =
    require('dap-install.api.debuggers').get_installed_debuggers()

  for _, debugger in ipairs(dbg_list) do
    dap_install.config(debugger)
  end
end

return M
