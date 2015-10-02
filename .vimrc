set nocompatible              " be iMproved
filetype off                  " required

" My Settings
set number
set nowrap
set linebreak
set backspace=indent,eol,start
set laststatus=2
set bg=dark
set t_Co=256
colorscheme torte 
syntax on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/solarized'
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
call vundle#end()

if has('gui_running')
	set background=dark
	colorscheme solarized
else
	let g:solarized_termcolors=256
	set background=dark
	colorscheme solarized
endif
let g:lightline = {
			\'colorscheme' : 'solarized',
			\}

filetype plugin indent on     " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to  auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
