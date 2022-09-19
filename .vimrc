" Controls tab spacing
set expandtab
set sw=2
set ts=2
set sts=2

" Plugins vim-plug (https://github.com/junegunn/vim-plug)
call plug#begin('~/.vim/plugged')

Plug 'rakr/vim-one'             " vim-one color theme
" Plug 'scrooloose/nerdtree'      " side bar file tree
Plug 'itchyny/lightline.vim'    " minimal status bar
Plug 'tpope/vim-commentary'     " use 'gcc' to comment/uncomment a line or a block
Plug 'ervandew/supertab'        " Supertab adds code completion to the <Tab> key
Plug 'tpope/vim-fugitive'       " Use git inside vim, :Git
Plug 'Yggdroot/indentLine'      " Show indentation lines
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'

call plug#end()

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Feature: Persistent Undo
" guard for distributions lacking the persistent_undo feature.
if has('persistent_undo')
    " define a path to store persistent_undo files.
    let target_path = expand('~/.config/vim-persisted-undo/')

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call system('mkdir -p ' . target_path)
    endif

    " point Vim to the defined undo directory.
    let &undodir = target_path

    " finally, enable undo persistence.
    set undofile
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

" Rust code completion
let g:LanguageClient_serverCommands = {
\ 'rust': ['rust-analyzer'],
\ }
