execute pathogen#infect()
syntax enable

set encoding=utf-8
set t_Co=256

nmap <silent> <F2> :TagbarToggle<CR>
nmap <silent> <F3> :NERDTreeToggle<CR>
nmap <silent> <F4> :ALEToggle<CR>
nmap <silent> <F12> :split $HOME/.vimrc<CR>
nnoremap <C-F5> :call UpdateTags()<CR>
nmap <silent> <C-F12> :e $HOME/.vimrc<CR>

" Close NERDTree if it's the only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Find and replace word under cursor
" Extra < and > ensure that only compelte words are matched (e.g. foo doesn't
" match to food)
nnoremap <Leader>r :%s/\<<C-r><C-w>\>//gcI<Left><Left><Left><Left>

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
set listchars=space:·,tab:··
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
set ignorecase
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

" macros for autocompleting braces/quotes
" taken from: https://vim.fandom.com/wiki/Making_Parenthesis_And_Brackets_Handling_Easier
inoremap {<CR> {<CR>}<Esc>O
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i

autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=CloseBracket()<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>

function ClosePair(char)
  if getline('.')[col('.') - 1] == a:char
  return "\<Right>"
  else
  return a:char
  endif
endf

function CloseBracket()
  if match(getline(line('.') + 1), '\s*}') < 0
  return "\<CR>}"
  else
  return "\<Esc>j0f}a"
  endif
endf

function QuoteDelim(char)
  let line = getline('.')
  let col = col('.')
  if line[col - 2] == "\\"
  "Inserting a quoted quotation mark into the string
  return a:char
  elseif line[col - 1] == a:char
  "Escaping out of the string
  return "\<Right>"
  else
  "Starting a string
  return a:char.a:char."\<Esc>i"
  endif
endf

func! WordProcessorMode()
  setlocal textwidth=80
  setlocal smartindent
  setlocal spell spelllang=en_us
  setlocal noexpandtab
endfu

com! WP call WordProcessorMode()

" Omnicomplete setup
" Requires ctags

if v:version >= 600
  filetype plugin on
  filetype indent on
else
  filetype on
endif

if v:version >= 700
  set omnifunc=syntaxcomplete#Complete " override built-in C omnicomplete with C++ OmniCppComplete plugin
  let OmniCpp_GlobalScopeSearch   = 1
  let OmniCpp_DisplayMode         = 1
  let OmniCpp_ShowScopeInAbbr     = 0 "do not show namespace in pop-up
  let OmniCpp_ShowPrototypeInAbbr = 1 "show prototype in pop-up
  let OmniCpp_ShowAccess          = 1 "show access in pop-up
  let OmniCpp_SelectFirstItem     = 1 "select first item in pop-up
  set completeopt=menuone,menu,longest
endif

function! UpdateTags()
  silent execute ":!ctags -R --languages=C,C++ --c++-kinds=+p --fields=+iaS --extras=+q ."
  echohl StatusLine | echo "C/C++ tag updated" | echohl None
endfunction

