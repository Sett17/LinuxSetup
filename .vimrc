"NeoBundle Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/sett/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('/home/sett/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'

NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'challenger-deep-theme/vim'

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------
colorscheme neon

set nocompatible

filetype 	on
filetype plugin on
filetype indent on
syntax		on
set		relativenumber
set 		ruler
set		cursorline
"set		cursorcolumn
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
