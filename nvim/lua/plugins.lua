-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  -- use 'w0rp/ale'
  use 'sheerun/vim-polyglot'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'tpope/vim-abolish'
  use 'altercation/vim-colors-solarized'
  use 'mattn/emmet-vim'
  -- use 'ycm-core/YouCompleteMe'
  -- use 'Quramy/tsuquyomi'
  -- use 'Quramy/tsuquyomi-vue'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use 'jose-elias-alvarez/null-ls.nvim'
  -- use 'MunifTanjim/prettier.nvim'
  use 'morhetz/gruvbox'

  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }
end)
