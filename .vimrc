set nocompatible              " be iMproved, required
filetype off                  " required by vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tomasr/molokai'
Plugin 'majutsushi/tagbar'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-surround'
Plugin 'ivanov/vim-ipython'
Plugin 'scrooloose/nerdtree'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdcommenter'

call vundle#end()


"
" General settings
"

" Create and load views silently on all files
autocmd BufWinLeave * if expand("%") != "" | mkview | endif
autocmd BufWinEnter * if expand("%") != "" | loadview | endif

" Enable automatic indentation
filetype plugin indent on


" Enable syntax highlighting
syntax on

" Enable 256 color support
set t_Co=256

" Solarized color scheme
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" Always show line numbers
:set number

" Fix copying in terminal with line numbers enabled
:set mouse=a

" Autostart
autocmd vimenter * NERDTree              " Open NERDTree
autocmd vimenter * MBEOpen               " Open minibufexplorer
autocmd vimenter * wincmd w              " Switch to buffer with open file

" Autoend
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif



"
" Custom key mappings
" 

" Remap flake8 to avoid no mapping bug
autocmd FileType python map <buffer> <F3> :call Flake8()<CR>

" Open/Close NERDTree with Ctrl+N
map <C-n> :NERDTreeToggle<CR>

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

" Switch to alternate file
map <C-Tab> :bnext<cr>
map <C-S-Tab> :bprevious<cr>

" Set paste toggle button
map <F10> :set invpaste<CR>
set pastetoggle=<F10>
