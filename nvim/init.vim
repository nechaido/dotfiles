call plug#begin()

" Completition
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'Shougo/neoinclude.vim'
Plug 'zchee/deoplete-clang'

Plug 'wellle/tmux-complete.vim'

" Language Server
Plug 'autozimu/LanguageClient-neovim', {
  \  'branch': 'next',
  \  'do': 'bash install.sh',
  \}

" Linting
Plug 'w0rp/ale'

" Syntax higlight
Plug 'othree/html5.vim'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'fleischie/vim-styled-components'
Plug 'arakashic/chromatica.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'rust-lang/rust.vim'

Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'cespare/vim-toml'

" Tmux integration
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tmux-plugins/vim-tmux'
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'

" Save keystrokes
Plug 'easymotion/vim-easymotion'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'

" Code comments
Plug 'scrooloose/nerdcommenter'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Markdown TOC
Plug 'mzlogin/vim-markdown-toc'

" UI
Plug 'scrooloose/nerdtree'

" Undo tree
Plug 'sjl/gundo.vim'

" Statusbar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'iCyMind/NeoSolarized'

call plug#end()

let g:ale_linters = {
  \  'c':          ['cppcheck',  'clang'],
  \  'cpp':        ['clangtidy', 'cppcheck', 'cpplint', 'clang'],
  \  'javascript': ['eslint', 'prettier'],
  \  'json':       ['prettier'],
  \}

let g:ale_fixers = {
  \ 'javascript': ['eslint', 'prettier'],
  \ 'json':       ['prettier'],
  \}

let g:airline#extensions#ale#enabled = 1

" Completition
let g:deoplete#enable_at_startup = 1

let g:deoplete#enable_camel_case = 1

let g:deoplete#delimeters = ['/', '.']

let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'

" LanguageClient settings

let g:LanguageClient_serverCommands = {
  \ 'rust':           ['rustup', 'run', 'nightly', 'rls'],
  \ 'javascript':     ['javascript-typescript-stdio'],
  \ 'javascript.jsx': ['javascript-typescript-stdio'],
  \}

" JavaScript settings
let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0

" Syntax highlight
syntax on

let g:chromatica#enable_at_startup = 1
let g:chromatica#highlight_feature_level = 1
let g:chromatica#responsive_mode = 1

" UI
set nowrap
set ruler
set showmode
set showmatch
set showcmd
set wildmenu

set path+=**

set laststatus=2

" Line numbers
set number
autocmd winenter,focusgained * :setlocal number relativenumber
autocmd winleave,focuslost   * :setlocal number norelativenumber

" Search settings
set incsearch
set hlsearch
set ignorecase
set smartcase
set gdefault

" Moving around
set whichwrap=b,s,<,>,[,]

" Indentation settings
set shiftwidth=2
set softtabstop=2
set tabstop=2
set smarttab
set expandtab
set shiftround

" File saving and reading
set autowrite
set autoread
set nobackup
set nowritebackup
set noswapfile

" Enable spell cheking for certain types of files
autocmd FileType gitcommit setlocal spell
autocmd FileType text      setlocal spell
autocmd FileType plaintex  setlocal spell
autocmd FileType tex       setlocal spell
autocmd FileType markdown  setlocal spell
autocmd FileType rst       setlocal spell

" Enable alternative keyboard layout (C-^ to switch)
set keymap=russian-jcuken
set iminsert=0
set imsearch=0

" Easier keyboard mappings for keyboard layout switching
inoremap <C-Space> <C-^>
nnoremap <C-Space> a<C-^><Esc>

" Splits
set splitbelow
set splitright

" delimitMate settings
let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1

" Gundo settings
let g:gundo_right = 1
let g:gundo_close_on_revert = 1

" ------------------------------------------------------------------------------
"  KEYBINDINGS
" ------------------------------------------------------------------------------
set mouse=a

" Setup a convenient leader key
let mapleader = ','

" Clear search highlighting
nmap <leader>/ :nohlsearch<CR>

" Fix style
nnoremap <leader>jsf :!eslint --fix %<CR>
nnoremap <leader>rf  :RustFmt<CR>
nnoremap <leader>f   :ALEFix<CR>

" Show the undo tree
nnoremap <leader>u :GundoToggle<CR>

" NERDTreee shortcuts
nnoremap <leader>n :NERDTreeToggle<CR>

" ------------------------------------------------------------------------------
"  COLORSCHEME
" ------------------------------------------------------------------------------
set termguicolors

let g:solarized_termcolors=256
set background=dark
colorscheme NeoSolarized

let g:neosolorized_italic = 1

let g:airline_powerline_fonts = 1
