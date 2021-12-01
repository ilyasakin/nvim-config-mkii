local M = {}

M.post = function()
  -- TODO: Modernize
  vim.cmd [[
let g:dashboard_default_executive ='telescope'
let g:dashboard_custom_header =<< trim END
    ___..._           _...___
   /'--.._ `'-="""=-'` _..--'\
   |   ~. )  _     _  ( .~   |
    \  '~/   a  _  a   \~'  /
     \  `|     / \     |`  /
      `'--\    \_/    /--'`
          .'._  J__.-'.
         / /  '-/_ `-  \
        / -"-'-.  '-.__/
        \__,-.\/     | `\
        /  ;---.  .--'   |
       |     /\'-'      /
       '.___.\   _.--;'`)
              '-'     `"
END

nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>
]]
end

return M
