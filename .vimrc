""" Basic vim config

set nocompatible
filetype plugin on
filetype indent on
syntax on


""" Vim Plug
call plug#begin()

"" Plugin - Colorschemes
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'
Plug 'ayu-theme/ayu-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'nanotech/jellybeans.vim'

"" Plugin - Language Support
Plug 'dense-analysis/ale'
Plug 'justinmk/vim-syntax-extra'
Plug 'sheerun/vim-polyglot'

"" Plugin - Utilities
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'henrik/vim-indexed-search'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'

call plug#end()


""" Colorscheme
if exists('+termguicolors')
  set termguicolors
endif
colorscheme jellybeans


""" Plugin Configuration

"" Config - Lightline
"vim setting, but I associate it with lightline so it goes here
set showtabline=2
let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline = {
    \ 'colorscheme': 'jellybeans',
    \ 'active': {
    \   'left': [
    \       [ 'mode', 'paste' ],
    \       [ 'gitbranch' ],
    \       [ 'readonly', 'filename', 'modified' ] ],
    \   'right': [
    \       [ 'lineinfo' ],
    \       [ 'percent' ],
    \       [ 'filetype' ] ]
    \ },
    \ 'tabline': {
    \   'left': [ [ 'buffers' ] ],
    \   'right': [ [ 'statuslinetabs' ] ]
    \ },
    \ 'component': {
    \   'filename': '%f'
    \ },
    \ 'component_expand': {
    \   'buffers': 'lightline#bufferline#buffers'
    \ },
    \ 'component_type': {
    \   'buffers': 'tabsel'
    \ },
    \ 'component_function': {
    \   'statuslinetabs': 'LightlineStatuslineTabs',
    \   'gitbranch': 'FugitiveHead'
    \ }
    \ }
"tab info credit to: https://github.com/alnj/dotfiles
function! LightlineStatuslineTabs()
  return join(map(range(1, tabpagenr('$')),
           \ '(v:val == tabpagenr() ? " >" : " �") . lightline#tab#tabnum(v:val)  . (v:val == tabpagenr() ? "" : "")'), "")
endfunction

"" Config - NERDTree
autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif

"" Config - indent line
let g:indentLine_enabled = 1
let g:indentLine_showFirstIndentLevel = 1
"let g:indentLine_setColors = 0
let g:indentLine_char = '�'
let g:indentLine_first_char = '�'

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
  set guioptions-=e "GUI Tabline
  set guioptions-=m "Menu

  "For some reason failing preview window sometimes causes gVim to crash
  autocmd VimEnter * command! -bang -nargs=? Files call fzf#vim#files(<q-args>, {'options': '--no-preview'}, <bang>0)
  "This one just doesn't run when preview fails
  autocmd VimEnter * command! -bang -nargs=? Buffers call fzf#vim#buffers(<q-args>, {'options': '--no-preview'}, <bang>0)
endif

"set listchars=space:�,tab:>�
set listchars=tab:>\ ,trail:�
set list

set viminfo='100,<1000

set title
set hidden

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set autoindent
set copyindent

set mouse=a
set number
set relativenumber
set cursorline
set nowrap
set backspace=indent,eol,start
set undolevels=1000
set undoreload=10000

set ignorecase
set showmatch
set hlsearch
set incsearch

set laststatus=2
set ruler
set wildmenu
set noerrorbells
set scrolloff=2
set sidescrolloff=4

if has('persistent_undo')
  let &undodir=expand('$HOME/.vim/undodir')
  set undofile
endif

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

nmap <silent> <F12> :e $HOME/.vimrc<CR>

" fzf bindings
nmap <silent> <C-p> :Files<CR>
nmap <silent> <Leader>pf :Files<CR>
nmap <silent> <Leader>pb :Buffers<CR>
nmap <silent> <Leader>ps :Colors<CR>
nmap <silent> <Leader>pt :Filetypes<CR>

nnoremap <silent> <Leader>l :set relativenumber!<CR>

" buffer bindings
nnoremap <Leader>bb :ls<CR>:b<Space>
nnoremap <Leader>bd :ls<CR>:bd<Space>
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bp :bp<CR>

" Find and replace word under cursor
" Extra < and > ensure that only compelte words are matched (e.g. foo doesn't
" match to food)
nnoremap <Leader>r :%s/\<<C-r><C-w>\>//gcI<Left><Left><Left><Left>
xnoremap <Leader>r y:%s/\<<C-r>0\>//gcI<Left><Left><Left><Left>

" cd to current file directory
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>

" insert mode clipboard paste
inoremap <C-v> <C-r>*
