-- setup
local opt = vim.opt
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- FIXME: port options from init.vim
-- " General stuff
-- filetype plugin indent on
-- syntax on
-- set autoindent
-- set timeoutlen=300
-- set encoding=utf-8
-- set noshowmode
-- set hidden
-- "set nowrap
-- set nojoinspaces
-- set number
-- set relativenumber
--
-- set formatoptions=tc " wrap text and comments using textwidth
-- set formatoptions+=r " continue comments when pressing ENTER in Insert mode
-- set formatoptions+=q " enable formatting of comments with gq
-- set formatoptions+=n " detect lists for formatting
-- set formatoptions+=b " auto-wrap in Insert mode, and do not wrap old long lines
--
-- " Sane splits
-- set splitright
-- set splitbelow
--
-- set scrolloff=3
--
-- set wildmenu
-- set wildmode=list:longest
-- set wildignore=.hg,.svn,.git,*~,*.png,*.jpg,*.gif,*.pdf,__pycache__,
--
-- " Permanent undo
-- set undodir=~/.vimdid
-- set undofile
--
-- " Search
-- set incsearch
-- set ignorecase
-- set smartcase
-- set gdefault
--
-- " Search with ripgrep if available
-- if executable('rg')
--     set grepprg=rg\ --no-heading\ --vimgrep
--     set grepformat=%f:%l:%c:%m
-- endif
--
-- " Tabs
-- set tabstop=4
-- set shiftwidth=4
-- set softtabstop=4
-- set expandtab
--
-- " ======================
-- " # UI SETTINGS
-- " ======================
-- "
-- " General stuff
-- set vb t_vb=
-- set ruler
-- set ttyfast
-- set lazyredraw
-- set showcmd
-- set mouse=a
-- set colorcolumn=100
-- set laststatus=2
-- set signcolumn=yes
--
-- set list
-- set listchars=nbsp:¬,extends:»,precedes:«,trail:•,tab:>-

-- highlight yanked area
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 500,
        })
    end,
})
