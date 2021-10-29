local exec = vim.api.nvim_command

exec('set encoding =utf-8')
exec('set number')
exec('set hidden')
exec('set nobackup')
exec('set nowritebackup')
exec('set termguicolors')
exec('set mouse +=a')
exec('set cmdheight =2')
exec('set updatetime =300')
exec('set clipboard =unnamedplus')
exec('set tabstop =2')
exec('set softtabstop =2')
exec('set shiftwidth =2')
exec('set expandtab')

vim.o.completeopt = "menuone,noselect"

exec('tnoremap <A-h> <C-\\><C-n><C-w>h')
exec('tnoremap <A-j> <C-\\><C-n><C-w>j')
exec('tnoremap <A-k> <C-\\><C-n><C-w>k')
exec('tnoremap <A-l> <C-\\><C-n><C-w>l')

exec('nnoremap <A-h> <C-w>h')
exec('nnoremap <A-j> <C-w>j')
exec('nnoremap <A-k> <C-w>k')
exec('nnoremap <A-l> <C-w>l')

exec('inoremap <C-v> <C-o>')

exec('nnoremap <C-Tab> :bn<CR>')

exec('nnoremap <silent> <C-b> :NvimTreeToggle<CR>')
