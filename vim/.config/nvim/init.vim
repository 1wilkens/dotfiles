" ======================
" # PLUGINS
" ======================
set nocompatible
filetype off

let mapleader = ','
let maplocalleader = ','

lua require('1wilkens')

runtime macros/matchit.vim

" lua << END
" local cmp = require'cmp'
"
" local lspconfig = require'lspconfig'
" cmp.setup({
"   snippet = {
"     -- REQUIRED by nvim-cmp. get rid of it once we can
"     expand = function(args)
"       vim.fn["vsnip#anonymous"](args.body)
"     end,
"   },
"   mapping = {
"     -- Tab immediately completes. C-n/C-p to select.
"     ['<Tab>'] = cmp.mapping.confirm({ select = true })
"   },
"   sources = cmp.config.sources({
"     -- TODO: currently snippets from lsp end up getting prioritized -- stop that!
"     { name = 'nvim_lsp' },
"   }, {
"     { name = 'path' },
"   }),
"   experimental = {
"     ghost_text = true,
"   },
" })
"
" -- Enable completing paths in :
" cmp.setup.cmdline(':', {
"   sources = cmp.config.sources({
"     { name = 'path' }
"   })
" })
"
" -- Setup lspconfig.
" local on_attach = function(client, bufnr)
"   local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
"   local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
"
"   --Enable completion triggered by <c-x><c-o>
"   buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
"
"   -- Mappings.
"   local opts = { noremap=true, silent=true }
"
"   -- See `:help vim.lsp.*` for documentation on any of the below functions
"   buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
"   buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
"   buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
"   buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
"   buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
"   buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
"   buf_set_keymap('n', '<space>r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
"   buf_set_keymap('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
"   buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
"   buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
"   buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
"   buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
"   buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.set_loclist()<CR>', opts)
"   buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
"
"   -- Get signatures (and _only_ signatures) when in argument lists.
"   require "lsp_signature".on_attach({
"     doc_lines = 0,
"     handler_opts = {
"       border = "none"
"     },
"   })
" end
"
" local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
" lspconfig.rust_analyzer.setup {
"   on_attach = on_attach,
"   flags = {
"     debounce_text_changes = 150,
"   },
"   settings = {
"     ["rust-analyzer"] = {
"       cargo = {
"         allFeatures = true,
"       },
"       completion = {
"     postfix = {
"       enable = false,
"     },
"       },
"     },
"   },
"   capabilities = capabilities,
" }
"
" vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
"   vim.lsp.diagnostic.on_publish_diagnostics, {
"     virtual_text = true,
"     signs = true,
"     update_in_insert = true,
"   }
" )
" END

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
" # UI SETTINGS
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

" colors
if has('nvim')
    let base16colorspace=256
    "colorscheme base16-atelier-dune
end

" diffs
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
map <C-p> :Telescope find_files<CR>
map <C-o> :Telescope buffers<CR>

map <C-Space> :Goyo<CR>

" Suspend with Ctrl-F
inoremap <C-f> <Esc>:sus<CR>
vnoremap <C-f> <Esc>:sus<CR>
nnoremap <C-f> :sus<CR>

" I can type :help on my own, thanks.
map <F1> <Esc>
imap <F1> <Esc>

" Completion

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
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
