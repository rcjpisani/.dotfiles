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
set term=screen-256color
set cursorline
set background=dark	
set hlsearch
set incsearch
set ignorecase
set smartcase
set lazyredraw

set noexpandtab
set shiftwidth=4
set tabstop=4
"set softtabstop=4

set autoindent
set smartindent
set nowrap
set linebreak
set number

set laststatus=2

set showmatch
set matchtime=2

set hidden

set cursorline

set splitbelow
set splitright

set noerrorbells
set novisualbell
set t_vb=
set tm=500

set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

set encoding=utf-8

try
	lang en_US
catch
endtry

set fileformats=unix,dos,mac

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
Plugin 'majutsushi/tagbar'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'garbas/vim-snipmate'
Plugin 'kien/ctrlp.vim'
Plugin 'chilicuil/vim-sprunge'
Plugin 'moll/vim-node'
Plugin 'tpope/vim-fugitive'

call vundle#end()

if has('gui_running')
	set guioptions-=m  "remove menu bar
	set guioptions-=T  "remove toolbar
	set guioptions-=r  "remove right-hand scroll bar
	set guioptions-=L  "remove left-hand scroll bar
endif

let mapleader=","

let g:lightline = {
      \ 'colorscheme': 'streamline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"|":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }
let g:cssColorVimDoNotMessMyUpdatetime = 1

filetype plugin indent on     " required

"Easy split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nmap <F8> :TagbarToggle<CR>
