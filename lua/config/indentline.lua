local M = {}

M.post = function()
  vim.g.indent_blankline_filetype_exclude = { 'packer', 'dashboard' }
end

return M
