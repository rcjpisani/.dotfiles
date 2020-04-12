set nocompatible              " be iMproved
filetype off                  " required

" My Settings
set path+=**
set wildmenu
set number
set relativenumber
set nowrap
set linebreak
set backspace=indent,eol,start
set laststatus=2
set bg=dark
set t_Co=256
set cursorline
set background=dark	
set hlsearch
set incsearch
set ignorecase
set smartcase
set lazyredraw
set foldmethod=indent

set noexpandtab
set tabstop=8
set softtabstop=8
set shiftwidth=8

if !has('nvim') && !exists('g:vscode')
	set term=screen-256color
endif

augroup twospaces
	autocmd!
	autocmd FileType javascript,json,html,typescript setlocal expandtab ts=2 sts=2 sw=2
augroup END

augroup fourspaces
	autocmd!
	autocmd FileType java,php,python setlocal expandtab ts=4 sts=4 sw=4
augroup END

augroup typescript
	autocmd!
	autocmd BufRead,BufNewFile *.ts setfiletype typescript
augroup END

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

set ttimeoutlen=0
set timeoutlen=1000

try
	lang en_US
catch
endtry

set fileformats=unix,dos,mac

" Base16
let base16colorspace=256
colorscheme base16-tomorrow-night

syntax on

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-syntastic/syntastic'
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
Plugin 'tpope/vim-fugitive'
Plugin 'leafgarland/typescript-vim'
Plugin 'vim-latex/vim-latex'
Plugin 'stephpy/vim-yaml'

call vundle#end()

if has('gui_running')
	set guioptions-=m  "remove menu bar
	set guioptions-=T  "remove toolbar
	set guioptions-=r  "remove right-hand scroll bar
	set guioptions-=L  "remove left-hand scroll bar
endif

let mapleader=","

let g:lightline = {
      \ 'colorscheme': 'Tomorrow_Night',
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

" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Create tags file
command! MakeTags !ctags -R .

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_php_checkers=['php', 'phpcs']
let g:syntastic_php_phpcs_args='--standard=PSR2 -n'
