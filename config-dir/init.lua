if vim.g.neovide then
    vim.o.guifont = "Hack Nerd Font Mono:h12"
    vim.g.neovide_scale_factor = 1.0
    vim.g.neovide_position_animation_length = 0
    vim.g.neovide_cursor_animation_length = 0.00
    vim.g.neovide_cursor_trail_size = 0
    vim.g.neovide_cursor_animate_in_insert_mode = false
    vim.g.neovide_cursor_animate_command_line = false
    vim.g.neovide_scroll_animation_far_lines = 0
    vim.g.neovide_scroll_animation_length = 0.00
end

require('mappings')

require('options')

require("config.lazy")

require('plugins')

require('plugin-configs/nvim-tree')

require('plugin-configs/airline')

require('plugin-configs/emmet')

require('plugin-configs/vim-move')

require('plugin-configs/ctrlsf')

require('plugin-configs/vim-cmp')

require('plugin-configs/lspconfig')

require('plugin-configs/null-ls')

require('plugin-configs/prettier')
