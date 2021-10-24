set encoding    =utf-8

set hidden

set nobackup
set nowritebackup

set termguicolors

set mouse+=a

set cmdheight   =2

set updatetime  =300

set clipboard   =unnamedplus
set tabstop     =2
set softtabstop =2
set shiftwidth  =2
set expandtab

inoremap <silent><expr> <c-space> coc#refresh()

tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Ctrl + v paste
inoremap <C-v> <C-o>"+gP
" Ctrl + tab switch tab
nnoremap <C-Tab> :bn<CR>

lua << EOF
require("bufferline").setup{}
EOF

