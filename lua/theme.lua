vim.api.nvim_command 'set t_Co =256'
vim.api.nvim_command 'syntax on'
vim.api.nvim_command 'set t_vi='
vim.api.nvim_command 'set guicursor +=a:blinkon333'

vim.cmd [[
highlight clear

function s:highlight(group, bg, fg, style)
  let gui = a:style == '' ? '' : 'gui=' . a:style
  let fg = a:fg == '' ? '' : 'guifg=' . a:fg
  let bg = a:bg == '' ? '' : 'guibg=' . a:bg
  exec 'hi ' . a:group . ' ' . bg . ' ' . fg  . ' ' . gui
endfunction

let s:Color6 = '#1C1E27'
let s:Color8 = '#16313e'
let s:Color0 = '#525863'
let s:Color4 = '#BCD4CF'
let s:Color1 = '#85EEA7'
let s:Color9 = '#505258'
let s:Color10 = '#3e4268'
let s:Color11 = '#15171d'
let s:Color5 = '#b5becf'
let s:Color3 = '#78A8D6'
let s:Color2 = '#7ADAD1'
let s:Color7 = '#f5f5f5'

call s:highlight('Comment', '', s:Color0, 'italic')
call s:highlight('Identifier', '', s:Color1, '')
call s:highlight('Constant', '', s:Color1, '')
call s:highlight('Number', '', s:Color2, 'bold')
call s:highlight('Type', '', s:Color3, 'bold')
call s:highlight('Function', '', s:Color1, 'bold')
call s:highlight('Keyword', '', s:Color2, 'bold')
call s:highlight('Conditional', '', s:Color4, 'bold')
call s:highlight('Repeat', '', s:Color4, 'bold')
call s:highlight('Operator', '', s:Color2, 'bold')
call s:highlight('StatusLine', s:Color5, s:Color6, '')
call s:highlight('WildMenu', s:Color6, s:Color7, '')
call s:highlight('Pmenu', s:Color6, s:Color7, '')
call s:highlight('PmenuSel', s:Color7, s:Color6, '')
call s:highlight('PmenuThumb', s:Color6, s:Color7, '')
call s:highlight('DiffAdd', s:Color8, '', '')
call s:highlight('Normal', s:Color6, s:Color7, '')
call s:highlight('Visual', s:Color9, '', '')
call s:highlight('CursorLine', s:Color9, '', '')
call s:highlight('ColorColumn', s:Color9, '', '')
call s:highlight('SignColumn', s:Color6, '', '')
call s:highlight('LineNr', '', s:Color10, '')
call s:highlight('TabLine', s:Color11, '', '')
call s:highlight('TabLineSel', '', s:Color6, '')
call s:highlight('TabLineFill', s:Color11, '', '')
call s:highlight('TSPunctDelimiter', '', s:Color7, '')

highlight! link TSFunction Function
highlight! link TSTagDelimiter Type
highlight! link TSFuncMacro Macro
highlight! link TSNumber Number
highlight! link TSFloat Number
highlight! link TSConstBuiltin TSVariableBuiltin
highlight! link Macro Function
highlight! link Conditional Operator
highlight! link Repeat Conditional
highlight! link TelescopeNormal Normal
highlight! link Folded Comment
highlight! link TSParameterReference TSParameter
highlight! link Operator Keyword
highlight! link TSKeyword Keyword
highlight! link NonText Comment
highlight! link TSOperator Operator
highlight! link CursorLineNr Identifier
highlight! link TSLabel Type
highlight! link Whitespace Comment
highlight! link TSProperty TSField
highlight! link TSField Constant
highlight! link TSComment Comment
highlight! link TSConstant Constant
highlight! link TSTag MyTag
highlight! link TSRepeat Repeat
highlight! link TSType Type
highlight! link TSParameter Constant
highlight! link TSString String
highlight! link TSNamespace TSType
highlight! link TSConditional Conditional
highlight! link TSPunctBracket MyTag
highlight! link TSPunctSpecial TSPunctDelimiter
]]
