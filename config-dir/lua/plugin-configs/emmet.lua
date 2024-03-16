-- prevent installation of global mappings
vim.g['user_emmet_install_global'] = 0

vim.cmd [[
  autocmd FileType cshtml,html,css,scss,sass EmmetInstall
]]
