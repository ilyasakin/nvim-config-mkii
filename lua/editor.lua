local exec = vim.api.nvim_command

vim.o.encoding = 'utf-8'
vim.wo.number = true
vim.o.hidden = true
vim.o.termguicolors = true
vim.o.mouse = 'a'
vim.o.cmdheight = 1
vim.o.updatetime = 100
vim.o.clipboard = 'unnamedplus'
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.completeopt = 'menuone,noselect'

exec 'tnoremap <A-h> <C-\\><C-n><C-w>h'
exec 'tnoremap <A-j> <C-\\><C-n><C-w>j'
exec 'tnoremap <A-k> <C-\\><C-n><C-w>k'
exec 'tnoremap <A-l> <C-\\><C-n><C-w>l'

exec 'nnoremap <A-h> <C-w>h'
exec 'nnoremap <A-j> <C-w>j'
exec 'nnoremap <A-k> <C-w>k'
exec 'nnoremap <A-l> <C-w>l'

exec 'inoremap <C-v> <C-o>'

exec 'nnoremap <C-Tab> :bn<CR>'

exec 'nnoremap <silent> <C-b> :NvimTreeToggle<CR>'
