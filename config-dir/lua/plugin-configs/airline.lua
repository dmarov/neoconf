-- airline
vim.g['airline#extensions#tabline#enabled'] = 1
vim.g['airline_theme'] = 'raven'
vim.g['airline_powerline_fonts'] = 1

vim.cmd [[
  if !exists('g:airline_symbols')
      let g:airline_symbols = {}
  endif
]]

vim.g['airline_left_sep'] = '»'
vim.g['airline_left_sep'] = '▶'
vim.g['airline_right_sep'] = '«'
vim.g['airline_right_sep'] = '◀'
vim.g['airline_symbols.linenr'] = '␊'
vim.g['airline_symbols.linenr'] = '␤'
vim.g['airline_symbols.linenr'] = '¶'
vim.g['airline_symbols.branch'] = '⎇'
vim.g['airline_symbols.paste'] = 'ρ'
vim.g['airline_symbols.paste'] = 'Þ'
vim.g['airline_symbols.paste'] = '∥'
vim.g['airline_symbols.whitespace'] = 'Ξ'
vim.g['airline_left_sep'] = ''
vim.g['airline_left_alt_sep'] = ''
vim.g['airline_right_sep'] = ''
vim.g['airline_right_alt_sep'] = ''
vim.g['airline_symbols.branch'] = ''
vim.g['airline_symbols.readonly'] = ''
vim.g['airline_symbols.linenr'] = ''
