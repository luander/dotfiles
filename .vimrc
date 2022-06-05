" Plugins vim-plug (https://github.com/junegunn/vim-plug)
call plug#begin('~/.vim/plugged')

Plug 'rakr/vim-one'             " vim-one color theme
" Plug 'scrooloose/nerdtree'      " side bar file tree
Plug 'itchyny/lightline.vim'    " minimal status bar
Plug 'tpope/vim-commentary'     " use 'gcc' to comment/uncomment a line or a block
Plug 'ervandew/supertab'        " Supertab adds code completion to the <Tab> key
Plug 'tpope/vim-fugitive'       " Use git inside vim, :Git
Plug 'Yggdroot/indentLine'      " Show indentation lines

call plug#end()

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Essential key remaps
inoremap jk <ESC>
noremap ; :

" Identation, syntax and encoding
filetype plugin indent on
syntax on
set encoding=utf-8

" Set to highlight search results
set hlsearch

" Set indentation character
let g:indentLine_char = '⦙'

set laststatus=2
set noshowmode

" For .yaml files, set ident to 2 spaces
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab