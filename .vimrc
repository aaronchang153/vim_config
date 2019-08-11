execute pathogen#infect()
syntax enable
filetype plugin indent on
"set omnifunc=syntaxcomplete#Complete
"set completeopt-=preview
"set tags+=~\tags\mingw.tags
"map <C-F12> :ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

set encoding=utf-8
set t_Co=256

nmap <silent> <F3> :NERDTreeToggle<CR>
nmap <silent> <F4> :ALEToggle<CR>
nmap <silent> <F12> :split $HOME/.vimrc<CR>
nmap <silent> <C-F12> :e $HOME/.vimrc<CR>

" Close NERDTree if it's the only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Find and replace word under cursor
" Extra < and > ensure that only compelte words are matched (e.g. foo doesn't
" match to food)
nnoremap <Leader>r :%s/\<<C-r><C-w>\>/

"set termguicolors
set background=dark
"colorscheme gruvbox
"colorscheme one
colorscheme base16-default-dark
"colorscheme nord

"let g:ale_sign_column_always=1
"set scl=no

"let g:airline_theme='gruvbox'
"let g:airline_theme='onedark'
let g:airline_theme='base16_default'
"let g:airline_theme='nord'

let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#fnamemod = ':t'
silent! call airline#extensions#whitespace#disable()


" Indent lines for spaces (disable by default)
let g:indentLine_enabled = 0
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
let g:indentLine_char = '┆'
let g:indentLine_first_char = '┆'
"let g:indentLine_char = '|'
"let g:indentLine_first_char = '|'

if has('gui_running')
  set guifont=Consolas:h11
  set lines=28
  set columns=115

  set guioptions-=T
  set guioptions-=r
  set guioptions-=L
endif

" Indent lines for tabs
"set list lcs=tab:┆\  
set listchars=space:.,tab:..
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
"highlight LineNr ctermfg=grey
set wrap!
set backspace=indent,eol,start
set title
set undolevels=100
"set ignorecase
set showmatch
set smarttab
"set hlsearch
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

"autocomplete + autotab for curly braces
inoremap {<CR> {<CR>}<C-o>O

func! WordProcessorMode()
  setlocal textwidth=80
  setlocal smartindent
  setlocal spell spelllang=en_us
  setlocal noexpandtab
endfu

com! WP call WordProcessorMode()

