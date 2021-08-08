" Theming
syntax on 
let g:airline_theme='base16_snazzy'
let g:airline_powerline_fonts = 1
highlight Pmenu ctermfg=7 ctermbg=18
highlight PmenuSel ctermfg=235 ctermbg=7

" Plugins
call plug#begin('~/.vim/plugged')
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'ycm-core/YouCompleteMe'
 Plug 'tpope/vim-fugitive'
 Plug 'tpope/vim-commentary'
 Plug 'tommcdo/vim-exchange'
 Plug 'Chiel92/vim-autoformat'
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
let mapleader=" "

map Y y$

set ttimeoutlen=0 " Fixes <ESC> delay using YCM
nmap <Leader>d <plug>(YCMHover)
nmap <Leader>q :YcmCompleter GoToInclude<CR>
nmap <Leader>w :YcmCompleter GoToDeclaration<CR>
nmap <Leader>e :YcmCompleter GoToDefinition<CR>
nmap <Leader>r :YcmCompleter GoToReferences<CR>
nmap <Leader>i :YcmCompleter GoToImplementation<CR>
nmap <Leader>f :Autoformat<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <C-k> :m .-2<CR>==
nnoremap <C-j> :m .+1<CR>==

" AutoCmd
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  au FileType * setlocal formatoptions-=cro
endif

" Auto-Completion
set completeopt-=preview " autocmd CompleteDone * pclose
set pumheight=16
let g:ycm_show_diagnostics_ui = 0
let g:ycm_auto_trigger = 0
let g:ycm_auto_hover = 1
let b:ycm_hover = { 'command': 'GetDoc', 'syntax': &filetype }
