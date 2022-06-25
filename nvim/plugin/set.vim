" SETS
" Tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Lines
set number
set relativenumber
set signcolumn=yes
set scrolloff=8
set nowrap

" Syntax highlighting
set hlsearch
set incsearch
set ignorecase
set smartcase
syntax on
set completeopt=menu,menuone,noselect

" Sounds
set noerrorbells
set novisualbell

" Buffer
set hidden
set noswapfile
set nobackup
set undofile
set undodir=~/.local/share/nvim/undo/
set updatetime=500

" Language
let g:XkbSwitchEnabled = 1
let g:XkbSwitchAssistNKeymap = 1    " for commands r and f
let g:XkbSwitchAssistSKeymap = 1    " for search lines
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
