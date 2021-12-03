local M = {}

M.post = function ()
  vim.cmd [[
    nnoremap x d
    xnoremap x d

    nnoremap xx dd
    nnoremap X D
  ]] 
end

return M
