set nocompatible              " be iMproved
filetype off                  " required

" My Settings
set number
set nowrap
set linebreak
set backspace=indent,eol,start
set autochdir
set laststatus=2
set bg=dark
set t_Co=256
set cursorline
set background=dark	
colorscheme Tomorrow-Night
syntax on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'godlygeek/tabular'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/snipmate-snippets'
Plugin 'scrooloose/nerdtree'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'garbas/vim-snipmate'
Plugin 'kien/ctrlp.vim'
call vundle#end()

if has('gui_running')
	set guioptions-=m  "remove menu bar
	set guioptions-=T  "remove toolbar
	set guioptions-=r  "remove right-hand scroll bar
	set guioptions-=L  "remove left-hand scroll bar
endif
let mapleader=","
let g:lightline = {
	\'colorscheme' : 'streamline',
	\}
let g:cssColorVimDoNotMessMyUpdatetime = 1
filetype plugin indent on     " required
