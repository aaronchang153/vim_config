""" Vim Plug
call plug#begin()

"" Plugin - Colorschemes
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'yuttie/hydrangea-vim'

"" Plugin - Language Support
Plug 'dense-analysis/ale'
Plug 'justinmk/vim-syntax-extra'
Plug 'MTDL9/vim-log-highlighting'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

"" Plugin - Utilities
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

call plug#end()


""" Colorscheme
"colorscheme hydrangea


""" Plugin Configuration

"" Config - NERDTree
" Close NERDTree if it's the only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"" Config - airline
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#fnamemod = ':t'
silent! call airline#extensions#whitespace#disable()

"" Config - indent line
" disable by default
let g:indentLine_enabled = 0
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
let g:indentLine_char = '┆'
let g:indentLine_first_char = '┆'

"" Config - session
let g:session_autosave='no'

"" Config - deocomplete
"let g:deoplete#enable_at_startup = 1


""" Vim Settings
set listchars=space:·,tab:>·
"set list

set hidden

set noexpandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set copyindent
set mouse=a
set number
set nowrap
set title
set undolevels=100
set ignorecase
set showmatch
set smarttab

set laststatus=2
set noerrorbells
set scrolloff=2
set sidescrolloff=4

" <zc> in normal mode to collapse a section
" <zx> to expand
" <za> to toggle
set foldmethod=indent
set foldlevel=99


""" Custom Bindings
nmap <silent> <F2> :TagbarToggle<CR>
nmap <silent> <F3> :NERDTreeToggle<CR>
nmap <silent> <F4> :ALEToggle<CR>
