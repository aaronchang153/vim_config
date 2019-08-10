execute pathogen#infect()
syntax enable
filetype plugin indent on
"set omnifunc=syntaxcomplete#Complete
"set completeopt-=preview
"set tags+=~\tags\mingw.tags
"map <C-F12> :ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

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
"colorscheme wombat
"let ayucolor="light"
"let ayucolor="mirage"
"let ayucolor="dark"
"colorscheme ayu
colorscheme gruvbox
"colorscheme onedark
"colorscheme one

"let g:ale_sign_column_always=1
"set scl=no

"let g:airline_theme='ayu_mirage'
let g:airline_theme='gruvbox'
"let g:airline_theme='onedark'
"let g:airline_theme='base16_flat'
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#fnamemod = ':t'
silent! call airline#extensions#whitespace#disable()

let g:indentLine_enabled = 0
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0

set encoding=utf-8
" Unicode indent lines to make them more seamless
let g:indentLine_char = '┆'
let g:indentLine_first_char = '┆'
"let g:indentLine_char = '|'
"let g:indentLine_first_char = '|'

if has('gui-running')
  set guifont=Consolas:h11

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
"set textwidth=80
set mouse=a
set number
"highlight LineNr ctermfg=grey
set wrap!
set backspace=indent,eol,start
"set ignorecase
set showmatch
set smarttab
"set hlsearch
set incsearch
set title
set undolevels=100

set encoding=utf-8
set laststatus=2
set ruler
set noerrorbells
set scrolloff=2
set sidescrolloff=4

" <za> in normal mode to collapse a section
set foldmethod=indent
set foldlevel=99

"autocomplete + autotab for curly braces
inoremap {<CR> {<CR>}<C-o>O

autocmd BufNewFile,BufRead *.sv set syntax=verilog
autocmd BufNewFile,BufRead *.svi set syntax=verilog

func! WordProcessorMode()
  setlocal textwidth=80
  setlocal smartindent
  setlocal spell spelllang=en_us
  setlocal noexpandtab
endfu

com! WP call WordProcessorMode()

