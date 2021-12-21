local exec = vim.api.nvim_command

vim.cmd [[
  nnoremap <SPACE> <Nop>
  let mapleader = "\<Space>"
  au FocusGained,BufEnter * :checktime
]]

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
vim.opt.splitbelow = true
