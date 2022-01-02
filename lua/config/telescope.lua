local M = {}

M.setup = function()
  require('telescope').setup {
    defaults = {
      file_ignore_patterns = { 'node_modules', 'dist' },
    },
  }
end
M.post = function()
  -- vim.api.nvim_set_keymap('n', '<Leader>ff', [[<cmd> lua require('telescope_builtin').find_files()<CR>]], { noremap = true })

  local nnoremap = vim.keymap.nnoremap

  nnoremap {
    '<C-p>',
    require('telescope.builtin').find_files,
    { silent = true },
  }
end

return M
