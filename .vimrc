syntax on 

set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent

set splitbelow
set splitright

set nu relativenumber
set incsearch nohlsearch
set expandtab
set guicursor=
set wrap
set so=8
set noerrorbells
set ruler

set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set scrolloff=8

set wildmenu
set cmdheight=1
set noshowmode

set updatetime=50
set mouse=a
set confirm

map Y y$

nnoremap <A-Up> :m-2<CR>
nnoremap <A-Down> :m+<CR>
inoremap <A-Up> <Esc>:m-2<CR>
inoremap <A-Down> <Esc>:m+<CR>

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ycm-core/YouCompleteMe'
call plug#end()

let g:airline_theme='base16_snazzy'
highlight Pmenu ctermfg=7 ctermbg=238
highlight PmenuSel ctermfg=235 ctermbg=7
