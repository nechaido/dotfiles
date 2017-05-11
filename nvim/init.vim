call plug#begin()

" Completition
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'Shougo/neoinclude.vim'
Plug 'zchee/deoplete-clang'

Plug 'ternjs/tern_for_vim', { 'do': 'npm install -g tern' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

Plug 'neomake/neomake'

" Syntax higlight
Plug 'arakashic/chromatica.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'pangloss/vim-javascript'
Plug 'moll/vim-node'
Plug 'PotatoesMaster/i3-vim-syntax'

" Save keystrokes
Plug 'easymotion/vim-easymotion'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'

" Code comments
Plug 'scrooloose/nerdcommenter'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" UI
Plug 'scrooloose/nerdtree'

" Undo tree
Plug 'sjl/gundo.vim'

" Statusbar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Colorschemes
Plug 'iCyMind/NeoSolarized'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'

call plug#end()

" Linter
autocmd! BufWritePost * Neomake

let g:neomake_highlight_lines=1

let g:neomake_javascript_enabled_makers = ['eslint']

let g:neomake_cpp_clang_maker = {
      \ 'exe' : 'clang++',
      \ 'args' : ['-std=c++11', '-pedantic', '-Wall', '-ferror-limit=0']
      \}

let g:neomake_cpp_enabled_makers = ['clang']

" Completition
let g:deoplete#enable_at_startup = 1

let g:deoplete#enable_camel_case = 1

let g:deoplete#delimeters = ['/', '.']

let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'

" Use tern_for_vim.
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

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

" Enable alternative keyboard layout (C-^ to switch)
set keymap=russian-jcuken
set iminsert=0
set imsearch=0

" Easier keyboard mappings for keyboard layout switching
inoremap <M-Space> <C-^>
nnoremap <M-Space> a<C-^><Esc>

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

" Setup a convenient leader key
let mapleader = ','

" Clear search highlighting
nmap <leader>/ :nohlsearch<CR>

" Fix style
nnoremap <leader>jsf :!eslint --fix %<CR>

" Show the undo tree
nnoremap <leader>u :GundoToggle<CR>

" NERDTreee shortcuts
nnoremap <leader>n :NERDTreeToggle<CR>

" ------------------------------------------------------------------------------
"  COLORSCHEME
" ------------------------------------------------------------------------------
set background=dark
colorscheme gruvbox

let g:airline_powerline_fonts=1
