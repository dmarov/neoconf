-- set encoding of terminal to utf-8
vim.opt.encoding = 'utf-8'

-- set output encoding to utf-8
vim.opt.fileencoding = 'utf-8'

--  enable 24-bit colors
vim.opt.termguicolors = true

-- do not unload buffer when it is abandoned
vim.opt.hidden = true

-- create folds by indent
vim.opt.foldmethod = 'indent'

-- has something to do with key mapping
vim.opt.keymap = 'russian-jcukenwin'

-- disables side effect of keymap set
vim.opt.iminsert = 0

-- disables side effect of keymap set
vim.opt.imsearch = 0

-- auto reload file changed outside of vim
vim.opt.autoread = true

-- write swap file every 250 milliseconds
vim.opt.updatetime = 250

-- do not write swap file
vim.opt.swapfile = false

-- do not create backup files
vim.opt.backup = false

-- write undo history on file write
vim.opt.undofile = true

-- set director to store undo files
vim.opt.undodir = vim.fn.expand('~/.local/share/nvim/backups')

-- show line numbers
vim.opt.number = true

-- use relative numbering
vim.opt.relativenumber = true

-- do not wrap lines which don't fit
vim.opt.wrap = false

-- highlight text line of the cursor
vim.opt.cursorline = true

-- display line at 80 column
vim.opt.colorcolumn = '80'

-- highlight characters
vim.opt.listchars = {tab = '▸ ',eol = '¬', trail = '·'}

-- has something to do with split character
vim.opt.fillchars:append('vert: ')

-- has something to do with lists
vim.opt.list = true

-- enables normal mode using different language
vim.opt.langmap = 'ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz'

-- execute commands from config files
vim.opt.exrc = true

-- forbid some commands for execution from config
vim.opt.secure = true

-- consider tab being 4 spaces
vim.opt.tabstop = 4

-- number of spaces for autoindent
vim.opt.shiftwidth = 4

-- consider blanks insert to comply with the rest of the file
vim.opt.smarttab = true

-- use spaces instead of tabs
vim.opt.expandtab = true

-- backup copy file and overwrite original
vim.opt.backupcopy = 'yes'

-- do not write backup file
vim.opt.writebackup = false

-- do smart indenting on new line
vim.opt.smartindent = true

-- keep at leas 10 lines up and down visible
vim.opt.scrolloff = 10

-- create swap file every 100 milliseconds
vim.opt.updatetime = 100

-- show menu on autocomplete
vim.opt.completeopt = 'menu'

-- show search result on the go
vim.opt.incsearch = true

-- disable folding on file open
vim.opt.foldenable = false

vim.cmd [[
  set completeopt=menu,menuone,noselect
]]

-- set theme
vim.cmd [[
  syntax enable
  colorscheme onedark
]]

-- always show status line
vim.cmd [[
  let laststatus = 2
]]

-- something related to terminal colors
vim.g['rehash256'] = 1

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false
  }
)
