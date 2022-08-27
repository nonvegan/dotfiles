" Theming
syntax on
colorscheme legacy_elflord
highlight! Special term=bold ctermfg=224
highlight! link Repeat Statement
highlight! link Operator Statement

let g:airline_theme='base16_snazzy'
let g:airline_powerline_fonts = 1
highlight Pmenu ctermfg=7 ctermbg=18
highlight PmenuSel ctermfg=235 ctermbg=7

" Plugins
runtime ftplugin/man.vim
call plug#begin('~/.vim/plugged')
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'ycm-core/YouCompleteMe'
 Plug 'tpope/vim-fugitive'
 Plug 'tpope/vim-commentary'
 Plug 'tommcdo/vim-exchange'
 Plug 'Chiel92/vim-autoformat'
 Plug 'jez/vim-superman'
 Plug 'preservim/nerdtree'
 Plug 'zeek/vim-zeek'
 Plug 'tpope/vim-surround'
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
set keywordprg=:Man

" Indentation
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

" Clipboard support
set clipboard=unnamedplus

" Keybinds
let mapleader=" "

map Y y$
map <F2> <CR>:Man 
map <leader>m :w<CR>:make -B<CR>
map <C-F5> :w<CR>:make -B run<CR>

set ttimeoutlen=0 " Fixes <ESC> delay using YCM
nmap <Leader>d <plug>(YCMHover)
nmap <Leader>q :YcmCompleter GoToInclude<CR>
nmap <Leader>w :YcmCompleter GoToDeclaration<CR>
nmap <Leader>e :YcmCompleter GoToDefinition<CR>
nmap <Leader>r :YcmCompleter GoToReferences<CR>
nmap <Leader>i :YcmCompleter GoToImplementation<CR>
nmap <Leader>f :Autoformat<CR>

nnoremap <C-k> a<Esc>:m .-2<CR>==gi<ESC>
nnoremap <C-j> a<Esc>:m .+1<CR>==gi<ESC>
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

nnoremap <F3> msO<ESC>==`s
nnoremap <F4> a<ESC>:.-d<CR>==gi<ESC>
inoremap <F3> <ESC>msO<ESC>==`sa
inoremap <F4> <ESC>:.-d<CR>==gi
vnoremap <F3> :<BS><CR>O<ESC>gv=gv
vnoremap <F4> :<BS><CR>kddgv=gv

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Void buffer
nnoremap <leader>d "_d
vnoremap <leader>d "_d
vnoremap <leader>p "_dP

" AutoCmd
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  au FileType * setlocal formatoptions-=cro
  au FileType man setlocal tabstop=8 " Fix tabs caused artifacts in man pages
endif

" Auto-Completion
set completeopt-=preview " autocmd CompleteDone * pclose
set pumheight=16
let g:ycm_show_diagnostics_ui = 0
let g:ycm_auto_trigger = 0
let g:ycm_auto_hover = 1
let b:ycm_hover = { 'command': 'GetDoc', 'syntax': &filetype }
