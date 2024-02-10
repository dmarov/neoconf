vim.g.mapleader = ' '

local function prevb()
  vim.cmd [[
    :bp | bw #
  ]]
end

local function quit_buffer()
  if (not pcall(prevb)) then
    vim.cmd [[
      :bw
    ]]
  end;
end

vim.keymap.set('n', '<leader>r', ':source $MYVIMRC<CR>', { silent = true })
vim.keymap.set('n', 'gb', ':bnext<CR>', { silent = true })
vim.keymap.set('n', 'gB', ':bprevious<CR>', { silent = true })
vim.keymap.set('n', 'bq', quit_buffer, { silent = true })
vim.keymap.set('n', 'bl', ':ls <CR>', { silent = true })

vim.api.nvim_set_keymap('n', 'F', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
