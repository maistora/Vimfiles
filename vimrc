" Vladimiroff's vimfile

" Forget about Vi compatibility.
set nocompatible

" Load plugins with vim-plug
runtime! plugs.vim

" Enable filetypes
filetype on
filetype plugin on
filetype plugin indent on
syntax on

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" Close preview split when completion is done
if exists('#CompleteDone')
    autocmd CompleteDone <buffer> pclose
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Switch between buffers without saving
set hidden

" Colors
set t_Co=256
set background=dark
set termguicolors
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1
let g:nord_comment_brightness = 12
let g:lightline = { 'colorscheme': 'nord' }
colorscheme nord
set noshowmode

" Mouse support
set mouse-=a
if !has('nvim')
    set ttymouse=xterm2
endif

" Send more characters for faster re-draws
set ttyfast

" Status line and fillchars
set fillchars=stl:-,stlnc:-,vert:│,fold:\ ,diff:-
set statusline=%F%m%r%h%w\ %y\ \ %=[%04l\|%04v][%p%%][%L\ lines]%{fugitive#statusline()}
set laststatus=2

" Disable swap files
set noswapfile

" Backups
if !exists('$SUDO_USER')
    set backup
    set backupdir=~/.vim/backups
endif

" Indent stuff
set smartindent
set autoindent

" Disable line wrapping
set nowrap

" Command line history
set history=50

" Show the cursor position all the time
set ruler

" Display incomplete commands
set showcmd

" Search options
set incsearch
set hlsearch

" Matching braces
set showmatch
set matchtime=3

" Default encoding
set encoding=utf-8

" Fancy title, based on opened file
set title

" We all know, what is that for
set nopaste

" Whitespace
set list
set listchars=tab:».,trail:.,extends:#,nbsp:.

" Command-line
set cmdheight=1
set wildmenu
set wildmode=list:longest,full
set wildignore+=*.o,*.obj,.git,*pyc,*pyo,*.pid,*.sock

" Clipbaord
if has('nvim')
  set clipboard+=unnamedplus
elseif has('unnamedplus')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif

" Completion options
set completefunc=syntaxcomplete#Complete
set completeopt=longest,menuone,preview

" Don't leave spaces between joined lines
set nojoinspaces

" Use tags from .tags file
set tags+=.tags

" NeoVim handles <ESC> keys as <M+key>
if has('nvim')
   set ttimeout
   set ttimeoutlen=0
endif

" Persistent undo
if has("persistent_undo") && !exists('$SUDO_USER')
    set undodir=~/.vim/undodir/
    set undofile
endif

" Don't persist viewdir
set viewdir=/tmp/vimviewdir

" Don't check for capital letters at start of sentence
if has ('syntax')
    set spellcapcheck=
endif

" Allow cursor to move where there is no text in visual block mode
if has('virtualedit')
    set virtualedit=block
endif

" Leader
let mapleader = "\<space>"

" Folding
"
" NOTE: foldmethod is manual by default and one might want to setlocal it for
" different filetypes.
set foldenable " Turn on folding
set foldclose=all " Close folds if you leave them in any way
set foldlevel=0 " Autofold everything by default
set foldnestmax=1 " Only fold the outer scope
set foldopen=all " Open folds if you touch them in any way

runtime! startup/*.vim
