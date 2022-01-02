local M = {}

M.setup = function()
  require('bufferline').setup {
    options = {
      show_close_icon = false,
      diagnostics = 'nvim_lsp',
      offsets = {
        {
          filetype = 'CHADTree',
          text = 'File Explorer',
          highlight = 'Directory',
          text_align = 'left',
        },
      },
    },
  }
end

return M
