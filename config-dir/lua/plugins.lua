vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  -- packer itself
  use 'wbthomason/packer.nvim'
  -- helper for html
  use 'mattn/emmet-vim'
  -- custom status line
  use 'vim-airline/vim-airline'
  -- themes for custom status line
  use 'vim-airline/vim-airline-themes'
  -- git
  use 'tpope/vim-fugitive'
  -- completion on Tab
  use 'ervandew/supertab'
  -- simple code comments
  use 'tpope/vim-commentary'
  -- advanced code comments
  use 'preservim/nerdcommenter'
  -- multicursor
  use 'mg979/vim-visual-multi'
  -- move selection with Alt
  use 'matze/vim-move'
  -- change brackets with cs"'
  use 'tpope/vim-surround'
  -- bookmarks with mm mi m...
  use 'MattesGroeger/vim-bookmarks'
  -- auto qoutes, parenthesis, brackets close
  use 'Raimondi/delimitMate'
  -- hightlights html matching tag
  use 'gregsexton/matchtag'
  -- full text search
  use 'dyng/ctrlsf.vim'
  -- marks line VCS status
  use 'mhinz/vim-signify'
  -- indentation
  use 'godlygeek/tabular'
  -- unit test runner
  use 'vim-test/vim-test'
  -- color theme
  use 'joshdick/onedark.vim'
  -- syntax highlight and indentation
  use 'sheerun/vim-polyglot'
  -- editorconfig
  use 'editorconfig/editorconfig-vim'
  -- undo tree visualizer
  use 'mbbill/undotree'
  -- configs for nvim lsp client
  use 'neovim/nvim-lspconfig'
  -- formatter
  use 'prettier/vim-prettier'
  -- completion
  use  {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
    }
  }
  -- directory browser
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
  }

  use {
    'MunifTanjim/prettier.nvim', 
    requires = {
      'nvimtools/none-ls.nvim',
      'nvim-lua/plenary.nvim',
    },
  }

  use 'David-Kunz/gen.nvim'
end)
