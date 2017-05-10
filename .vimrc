set nocompatible 	"be iMproved

set nu
set cul cuc

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if has('gui_running')
    set guioptions=ia
    set guifont=Source\ Code\ Pro\ 12
endif

"VIM-PLUG ==========
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'keith/swift.vim', { 'for': 'swift' }
Plug 'junegunn/fzf'
"Plug 'kristijanhusak/vim-hybrid-material'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'mhartington/oceanic-next'
"Plug 'mhinz/vim-janah'
Plug 'mhinz/vim-startify'
Plug 'lambdalisue/vim-gita'
Plug 'itchyny/lightline.vim'
Plug 'jacoborus/tender'

call plug#end()

filetype plugin indent on

"=================================================================
" LightLine
set noshowmode	"lightline does it for you
set laststatus=2
set showtabline=2
let g:lightline = {
    \ 'colorscheme': 'tender',
    \ 'active': {
    \   'left': [
    \       [ 'mode', 'paste' ],
    \       [ 'readonly', 'filename', 'modified' ],
    \   ],
    \   'right': [
    \       [ 'percent', 'lineinfo' ],
    \       [ 'fileformat', 'fileencoding', 'filetype' ],
    \   ],
    \ },
    \
    \ 'tabline': {
    \   'left': [
    \       [ 'bufnum', 'relativepath' ],
    \   ],
    \   'right': [
    \       [ 'git_branch', 'git_traffic', 'git_status' ],
    \   ],
    \ },
    \
    \ 'component': {
    \   'readonly': '%{&filetype=="help"?"":&readonly?"":""}',
    \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
    \ },
    \
    \ 'component_visible_condition': {
    \   'readonly': '(&filetype!="help"&& &readonly)',
    \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
    \ },
    \
    \ 'component_function': {
    \   'git_branch': 'g:lightline.my.git_branch',
    \   'git_traffic': 'g:lightline.my.git_traffic',
    \   'git_status': 'g:lightline.my.git_status',
    \ },
    \
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' },
    \ }

    "\   'lineinfo': '(winwidth(0)) >= 70',

let g:lightline.my = {}
function! g:lightline.my.git_branch() " {{{
  return winwidth(0) > 70 ? gita#statusline#preset('branch') : ''
endfunction " }}}
function! g:lightline.my.git_traffic() " {{{
  return winwidth(0) > 70 ? gita#statusline#preset('traffic') : ''
endfunction " }}}
function! g:lightline.my.git_status() " {{{
  return winwidth(0) > 70 ? gita#statusline#preset('status') : ''
endfunction " }}}

"=================================================================

if has('termguicolors')
    set termguicolors
endif

syntax enable
set background=dark
let g:enable_bold_font = 1

"colorscheme hybrid_material
colorscheme OceanicNext
"colorscheme janah

" VIM-MARKDOWN
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_autowrite = 1

"=================================================================
augroup reload_vimrc
    autocmd!
    autocmd bufwritepost $MYVIMRC nested source $MYVIMRC
augroup END

