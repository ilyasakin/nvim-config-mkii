local M = {}

local which_key = require 'which-key'

M.setup = function()
  which_key.setup {}
end

M.post = function()
  which_key.register({
    f = { name = 'file', t = 'File Tree' },
    e = { name = 'editor' },
    h = { name = 'git hunk' },
    s = { name = 'session' },
    c = { name = 'code actions', a = 'get code actions' },
  }, { prefix = '<leader>' })
end

return M
