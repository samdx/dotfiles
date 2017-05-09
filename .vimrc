set nocompatible
syntax on
set nu
set cul cuc
"set cc+=1
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4

set guioptions=ia
set guifont=Source\ Code\ Pro\ 12
set laststatus=2

"VIM-PLUG ==========
call plug#begin('~/.vim/plugged')

Plug 'keith/swift.vim'
Plug 'junegunn/fzf'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'plasticboy/vim-markdown'
Plug 'mhartington/oceanic-next'
Plug 'mhinz/vim-janah'
Plug 'mhinz/vim-startify'
call plug#end()

if (has("termguicolors"))
    set termguicolors
endif

syntax enable
set background=dark
"colorscheme hybrid_material
colorscheme OceanicNext
"colorscheme janah

" VIM-MARKDOWN
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_autowrite = 1

