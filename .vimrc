""" Vim Plug
call plug#begin()

"" Plugin - Colorschemes
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'
Plug 'yuttie/hydrangea-vim'
Plug 'ayu-theme/ayu-vim'

"" Plugin - Language Support
Plug 'dense-analysis/ale'
Plug 'justinmk/vim-syntax-extra'
Plug 'MTDL9/vim-log-highlighting'

"" Plugin - Utilities
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'henrik/vim-indexed-search'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mbbill/undotree'

call plug#end()


""" Colorscheme
if exists('+termguicolors')
  set termguicolors
endif
let ayucolor="dark"
colorscheme ayu


""" Plugin Configuration

"" Config - NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"" Config - airline
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#fnamemod = ':t'
silent! call airline#extensions#whitespace#disable()

"" Config - indent line
let g:indentLine_enabled = 1
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
let g:indentLine_char = '¦'
let g:indentLine_first_char = '¦'

"" Config - session
let g:session_autosave='no'

"" Config - gutentags
let g:gutentags_enabled = 0


""" Vim Settings

if has('gui_running')
  autocmd GUIEnter * set vb t_vb=

  set guifont=Consolas:h11
  set lines=28
  set columns=115

  set guioptions-=T "Toolbar
  set guioptions-=r "Right Scrollbar
  set guioptions-=L "Left Scrollbar
  "set guioptions-=m "Menu
endif

set listchars=space:·,tab:>·
set list

set viminfo='100,<1000

set hidden

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set copyindent
set mouse=a
set number
set nowrap
set backspace=indent,eol,start
set title
set undolevels=100
set ignorecase
set showmatch
set smarttab
set hlsearch
set incsearch

set laststatus=2
set ruler
set noerrorbells
set scrolloff=2
set sidescrolloff=4

" <zc> in normal mode to collapse a section
" <zx> to expand
" <za> to toggle
set foldmethod=indent
set foldlevel=99

set completeopt-=preview


""" Custom Bindings
nmap <silent> <F2> :TagbarToggle<CR>
nmap <silent> <F3> :NERDTreeToggle<CR>
nmap <silent> <F4> :ALEToggle<CR>
nmap <silent> <F9> :UndotreeToggle<CR>

nmap <silent> <F12> :split $HOME/.vimrc<CR>
nmap <silent> <C-F12> :e $HOME/.vimrc<CR>

" Find and replace word under cursor
" Extra < and > ensure that only compelte words are matched (e.g. foo doesn't
" match to food)
nnoremap <Leader>r :%s/\<<C-r><C-w>\>//gcI<Left><Left><Left><Left>
xnoremap <Leader>r y:%s/\<<C-r>0\>//gcI<Left><Left><Left><Left>

nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>
