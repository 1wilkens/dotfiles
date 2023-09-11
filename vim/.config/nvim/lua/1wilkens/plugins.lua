-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

return require('lazy').setup({
  -- base16
  'chriskempson/base16-vim',

  -- lightline
  'itchyny/lightline.vim',

  -- devicons
  'kyazdani42/nvim-web-devicons',

  -- tpope basics
  'tpope/vim-eunuch',       -- unix wrappers
  'tpope/vim-speeddating',  -- correct handling of dates, times, etc.
  'tpope/vim-surround',     -- manipulate surrounding elements

  -- peekabo: buffer peeking on yank
  'junegunn/vim-peekaboo',

  -- comment.nvim: better comments for nvim
  {
  'numToStr/Comment.nvim',
    lazy = false
  },

  -- gitsigns.nvim: git decorations
  {
  'lewis6991/gitsigns.nvim',
    tag = 'release',
  },

  -- goyo: focused writing
  'junegunn/goyo.vim',

  -- telescope (+fzf)
  {
    {
    'nvim-telescope/telescope.nvim',
      branch = '0.1.x',
      dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
      },
      opts = {
        defaults = {
        },
        pickers = {
          find_files = {
            hidden = true
          }
        },
        extensions = {
        }
      }
    },
  },

  -- tree-sitter
  {
  'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },

  -- filetypes
  { 'lervag/vimtex', ft = {'tex'} },
  { 'cespare/vim-toml', ft = {'toml'} },
  { 'Matt-Deacalion/vim-systemd-syntax', ft = {'systemd'} },
  { 'dart-lang/dart-vim-plugin', ft = {'dart'} },
  { 'hankchiutw/flutter-reload.vim', ft = {'dart'} },
  { 'plasticboy/vim-markdown', ft = {'markdown'} },
  { 'mephux/bro.vim', ft = {'bro', 'zeek'} },
  { 'chrisbra/csv.vim', ft = {'csv'} },
})

--[[

" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'hrsh7th/cmp-nvim-lsp', {'branch': 'main'}
Plug 'hrsh7th/cmp-buffer', {'branch': 'main'}
Plug 'hrsh7th/cmp-path', {'branch': 'main'}
Plug 'hrsh7th/nvim-cmp', {'branch': 'main'}
Plug 'ray-x/lsp_signature.nvim'

" Only because nvim-cmp _requires_ snippets
Plug 'hrsh7th/cmp-vsnip', {'branch': 'main'}
Plug 'hrsh7th/vim-vsnip'

" vim enhancements
Plug 'ciaranm/securemodelines'
Plug 'tpope/vim-fugitive'

" Notes (only for non-root)
" FIXME: This should work via uid/euid but $UID doesn't work
if $USER != 'root'
    Plug 'pedrosans/vim-misc'
    Plug 'pedrosans/vim-notes'
end --]]

-- vim:set et sw=2
