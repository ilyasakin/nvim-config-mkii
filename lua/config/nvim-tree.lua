vim.cmd [[
nnoremap <silent> <C-b> :NvimTreeToggle<CR>
]]

local timer = vim.loop.new_timer()
local refresh_tree = require('nvim-tree.lib').refresh_tree

require('nvim-tree.events').on_nvim_tree_ready(function()
  timer:start(
    1000,
    1000,
    vim.schedule_wrap(function()
      refresh_tree()
    end)
  )
end)

