" ======================
" # PLUGINS
" ======================
set nocompatible
filetype off

let mapleader = ','
let maplocalleader = ','

call plug#begin('~/.local/share/nvim/plugged')

" VIM enhancements
Plug 'ciaranm/securemodelines'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'

" GUI enhancements
Plug 'chriskempson/base16-vim'
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'mhinz/vim-signify'

" Linting & Quick Fixes (coc)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Language specific
Plug 'lervag/vimtex'
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'
Plug 'Matt-Deacalion/vim-systemd-syntax'
Plug 'dart-lang/dart-vim-plugin'
Plug 'hankchiutw/flutter-reload.vim'
Plug 'plasticboy/vim-markdown'
Plug 'mephux/bro.vim'
Plug 'chrisbra/csv.vim'

" Notes (only for non-root)
" FIXME: This should work via uid/euid but $UID doesn't work
if $USER != 'root'
    Plug 'pedrosans/vim-misc'
    Plug 'pedrosans/vim-notes'
end

call plug#end()

runtime macros/matchit.vim

" ======================
" # EDITOR SETTINGS
" ======================
"
" General stuff
filetype plugin indent on
syntax on
set autoindent
set timeoutlen=300
set encoding=utf-8
set noshowmode
set hidden
"set nowrap
set nojoinspaces
set number
set relativenumber

set formatoptions=tc " wrap text and comments using textwidth
set formatoptions+=r " continue comments when pressing ENTER in Insert mode
set formatoptions+=q " enable formatting of comments with gq
set formatoptions+=n " detect lists for formatting
set formatoptions+=b " auto-wrap in Insert mode, and do not wrap old long lines

" Sane splits
set splitright
set splitbelow

set scrolloff=3

set wildmenu
set wildmode=list:longest
set wildignore=.hg,.svn,.git,*~,*.png,*.jpg,*.gif,*.pdf,__pycache__,

" Permanent undo
set undodir=~/.vimdid
set undofile

" Search
set incsearch
set ignorecase
set smartcase
set gdefault

" Search with ripgrep if available
if executable('rg')
    set grepprg=rg\ --no-heading\ --vimgrep
    set grepformat=%f:%l:%c:%m
endif

" Tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" ======================
" # GUI SETTINGS
" ======================
"
" General stuff
set vb t_vb=
set ruler
set ttyfast
set lazyredraw
set showcmd
set mouse=a
set colorcolumn=100
set laststatus=2
set signcolumn=yes

set list
set listchars=nbsp:¬,extends:»,precedes:«,trail:•,tab:>-

" Colors
if has('nvim')
    let base16colorspace=256
    colorscheme base16-atelier-dune
end

" Diffs
if has('nvim-0.3')
    set diffopt+=algorithm:patience
    set diffopt+=indent-heuristic
end

" ======================
" # COMMANDS
" ======================
"
" trim trailing whitespaces
command TrimTrailing :%s/\s\+$//

" ======================
" # KEYBINDINGS
" ======================
"
" ; as :
nnoremap ; :

" No arrow keys..
nnoremap <up> <nop>
nnoremap <down> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>

" Left and right can switch buffers
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

" Move by line
nnoremap j gj
nnoremap k gk

" Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Open hotkeys
map <C-p> :Files<CR>
map <C-o> :Buffers<CR>

map <C-Space> :Goyo<CR>

" Suspend with Ctrl-F
inoremap <C-f> <Esc>:sus<CR>
vnoremap <C-f> <Esc>:sus<CR>
nnoremap <C-f> :sus<CR>

" I can type :help on my own, thanks.
map <F1> <Esc>
imap <F1> <Esc>

" Completion
"
" 'Smart' nevigation
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" ======================
" # LANGUAGE SETTINGS
" ======================

" rust
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'wl-copy'

" Completion
" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

if executable('rustc')
    let $RUST_SRC_PATH = systemlist('rustc --print sysroot')[0] . '/lib/rustlib/src/rust/src'
end

" Latex
"
" latexmk build dir to find labels for completion
let g:vimtex_compiler_latexmk = {
    \ 'build_dir' : './build',
    \}

let g:vimtex_toc_config = {
    \ 'layers' : [ 'content', 'todo', 'include' ],
    \ 'split_width' : 45,
    \ 'tocdepth' : 1,
    \}

let g:tex_flavor = "latex"

" ======================
" # PLUGIN SETTINGS
" ======================

" securemodelines
let g:secure_modelines_allowed_items = [
                \ "textwidth",   "tw",
                \ "softtabstop", "sts",
                \ "tabstop",     "ts",
                \ "shiftwidth",  "sw",
                \ "expandtab",   "et",   "noexpandtab", "noet",
                \ "filetype",    "ft",
                \ "foldmethod",  "fdm",
                \ "readonly",    "ro",   "noreadonly", "noro",
                \ "rightleft",   "rl",   "norightleft", "norl",
                \ "colorcolumn"
                \ ]

" fzf
let g:fzf_layout = { 'down': '~20%' }
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \ <bang>0 ? fzf#vim#with_preview('up:60%')
  \         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \ <bang>0)

" goyo
let g:goyo_width = '30%'
let g:goyo_height = '90%'


" lightline
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'cocstatus': 'coc#status'
      \ },
      \ }
function! LightlineFilename()
  return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction

" Use auocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" notes
let g:notes_suffix = '.md'
let g:notes_title_sync = 'rename_file'
let g:notes_unicode_enabled = 0
let g:notes_smart_quotes = 0
if isdirectory($HOME . '/sync/doc/notes')
    let g:notes_directories = ['~/sync/doc/notes']
end
