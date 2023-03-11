" Plugins
runtime ftplugin/man.vim
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline' " Status/Tab line
Plug 'sainnhe/sonokai' " Monokai theme
Plug 'tpope/vim-fugitive' " Git wrapper
Plug 'airblade/vim-gitgutter' " Git Signs
Plug 'kshenoy/vim-signature' " Mark Signs
Plug 'ycm-core/YouCompleteMe' " Auto completion
Plug 'dense-analysis/ale' " Linting, syntax checking, lsp
Plug 'Chiel92/vim-autoformat' " Auto formatting
Plug 'tpope/vim-commentary' " Auto commenting
Plug 'jiangmiao/auto-pairs' " Auto pairing
Plug 'tommcdo/vim-exchange' " Exchange operations
Plug 'tpope/vim-surround' " Surround operations
Plug 'preservim/nerdtree' " File Tree
Plug 'ctrlpvim/ctrlp.vim' " File searching
Plug 'jez/vim-superman' " Open Man pages with vim
Plug 'zeek/vim-zeek' " Zeek syntax highligthing
call plug#end()

" Theming
syntax on

if has('termguicolors')
  set termguicolors
endif

let g:sonokai_style = 'default' " default, atlantis, andromeda, maia
let g:sonokai_better_performance = 1
let g:sonokai_transparent_background = 2
let g:sonokai_menu_selection_background = "green"
let g:sonokai_colors_override = {'red': ['#ff6d7e', '1'],
                                \'green': ['#a2e57b', '2'],
                                \'yellow': ['#ffed72', '3'],
                                \'purple': ['#baa0f8', '5'],
                                \'blue': ['#7cd5f1', '6'],
                                \'fg': ['#f2fffc', '7'],
                                \'orange': ['#fc9867', '172']}


let g:airline_theme = 'sonokai'
let g:airline_powerline_fonts = 1
colorscheme sonokai

" General
set nu relativenumber
set scrolloff=8
set splitbelow
set splitright
set nowrap
set guicursor=
set incsearch nohlsearch ignorecase smartcase
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
set updatetime=250
set ttimeoutlen=0

" Undo/Redo
set noswapfile
set nobackup
set undofile
set undodir=~/.vim/undodir

" Clipboard support
set clipboard=unnamedplus

" Keybinds
let mapleader=" "

" Disable Ex mode
:map Q <Nop>

map Y y$
map <Leader>s :update<CR>
map <F2> <CR>:Man 
map <leader>m :w<CR>:make -B<CR>
map <C-F5> :w<CR>:make -B run<CR>

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

nnoremap <F3> msO<ESC>==`s:delmarks s<CR>
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
    " au QuickFixCmdPost *grep* cwindow
endif

" Auto-Completion
set completeopt-=preview " autocmd CompleteDone * pclose
set pumheight=16
let g:ycm_show_diagnostics_ui = 0
let g:ycm_auto_trigger = 0
let g:ycm_auto_hover = 1
let b:ycm_hover = { 'command': 'GetDoc', 'syntax': &filetype }

" Searching
let g:ctrlp_cmdmap = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" Auto-Format
let g:formatters_python = ['black']

" ALE
 let g:ale_linters = {'python': ['flake8']}

" Check Syntax group
function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
command CheckSyntaxGroyp call SynGroup()
