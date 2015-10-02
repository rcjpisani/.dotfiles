set nocompatible              " be iMproved
filetype off                  " required!

" My Settings
set number
set nowrap
set linebreak
set backspace=indent,eol,start
set laststatus=2
set t_Co=256
colorscheme torte
syntax on

set rtp+=/home/robert/.vim/bundle/Vundle.vim
call vundle#begin()
" Bundles
Bundle 'VundleVim/Vundle.vim' 
Bundle 'itchyny/lightline.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'godlygeek/tabular'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/snipmate-snippets'
Bundle 'scrooloose/nerdtree'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/vim-snippets'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'garbas/vim-snipmate'
call vundle#end()
let g:lightline = {
			\'colorscheme' : 'solarized',
			\}

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.
