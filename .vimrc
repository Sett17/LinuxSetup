set nocompatible

filetype  on
filetype plugin on
filetype indent on
syntax    on
set   relativenumber
set     ruler
set   cursorline
"set    cursorcolumn
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set scrolloff=7

set mouse=a

set ignorecase

set showmode
set history=100

set wildmenu
set wildmode=list:longest

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-airline/vim-airline'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
