" Theming
syntax on 
let g:airline_theme='base16_snazzy'
highlight Pmenu ctermfg=7 ctermbg=18
highlight PmenuSel ctermfg=235 ctermbg=7

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ycm-core/YouCompleteMe'
call plug#end()

" General
set nu relativenumber
set scrolloff=8
set splitbelow
set splitright
set wrap
set guicursor=
set incsearch nohlsearch
set noerrorbells

" Identation
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set expandtab

" Lower bar
set wildmenu
set noshowmode
set cmdheight=1
set confirm
set ruler
set mouse=a
set updatetime=50

" Undo/Redo
set noswapfile
set nobackup
set undofile
set undodir=~/.vim/undodir

" Keybinds
map Y y$
nnoremap <A-Up> :m-2<CR>
nnoremap <A-Down> :m+<CR>
inoremap <A-Up> <Esc>:m-2<CR>
inoremap <A-Down> <Esc>:m+<CR>

" Misc
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  au FileType * setlocal formatoptions-=cro
endif

" Auto-Completion
set pumheight=16
set completeopt-=preview "Close preview after done writing -> autocmd CompleteDone * pclose
let g:ycm_show_diagnostics_ui = 0
let g:ycm_auto_trigger = 0
