-- CtrlSF
vim.g['ctrlsf_default_view_mode'] = 'compact'
vim.g['ctrlsf_position'] = 'bottom'
vim.g['ctrlsf_regex_pattern'] = 1
vim.g['ctrlsf_selected_line_hl'] = 'op'
vim.g['ctrlsf_winsize'] = '100%'
vim.g['ctrlsf_backend'] = 'pt'

vim.keymap.set('n', '<leader>s', ':CtrlSF ')
