local M = {}

M.post = function()
  local nnoremap = vim.keymap.nnoremap

  vim.g.dashboard_default_executive = 'telescope'
  vim.g.dashboard_custom_header = {
    [[    ___..._           _...___]],
    [[   /'--.._ `'-="""=-'` _..--'\]],
    [[   |   ~. )  _     _  ( .~   |]],
    [[    \  '~/   a  _  a   \~'  /]],
    [[     \  `|     / \     |`  /]],
    [[      `'--\    \_/    /--'`]],
    [[          .'._  J__.-'.]],
    [[         / /  '-/_ `-  \]],
    [[        / -"-'-.  '-.__/]],
    [[        \__,-.\/     | `\]],
    [[        /  ;---.  .--'   |]],
    [[       |     /\'-'      /]],
    [[       '.___.\   _.--;'`)]],
    [[              '-'     `"]],
  }

  vim.g.dashboard_custom_section = {
    a = {
      description = { '  New File                       SPC f n' },
      command = 'DashboardNewFile',
    },
    b = {
      description = { '  Find File                      SPC f f' },
      command = 'Telescope find_files',
    },
  }

  nnoremap {
    '<Leader>fn',
    '<cmd>DashboardNewFile<CR>',
    { silent = true },
  }
end

return M
