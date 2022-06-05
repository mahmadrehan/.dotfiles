" clipboard
set clipboard=unnamedplus
set path+=**
set shiftwidth=2
set tabstop=2 softtabstop=2
set expandtab
set cindent
set smartindent
set autoindent
" set for folding stuff
set foldmethod=indent
set foldlevel=24
" makes it so you can have local .vimrc files and put custom config in there set exrc
set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
set nowrap
set noswapfile
set nobackup
set backspace=indent,eol,start
set undodir=~/.vin/undodir
set undofile
set incsearch
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
set colorcolumn=92
set encoding=utf-8
" Give more space for displaying msgs n stuff
set cmdheight=2
" reducing the refresh time for the editor
set updatetime=50
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
set wildmode=longest,list
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*
" give all color range to the terminal
set t_Co=256

if (has("termguicolors"))
   set termguicolors
endif

