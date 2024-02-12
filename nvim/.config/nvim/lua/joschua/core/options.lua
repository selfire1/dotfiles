vim.o.icm = "split"

-- hacky setting via vim

vim.cmd([[
" init.lua: for plugins and keymaps
" .vimrc: for vim-specific config

" https://neovim.io/doc/user/quickref.html#option-list

" Load plugins
filetype plugin indent on

" Search
set ignorecase 
set smartcase 

" Tab completion
set wildmode=list:longest,full
set wildignore=*.swp,*.o,*.so,*.exe,*.dll

" Tab settings
set ts=2 
set sw=2 
set expandtab 
" set autoindent

" Hud
set termguicolors 
syntax on
set ruler " show line number on bar
set number 
" set nowrap
set fillchars=vert:\│
" set colorcolumn=80
set cursorline 
set relativenumber 
set hidden
set listchars=tab:»·,trail:·
set list
set scrolloff=5

" split windows
set splitright
set splitbelow

" Tags
set tags=./tags;/,tags;/

" Backup Directories
set backupdir=~/.config/nvim/backups,.
set directory=~/.config/nvim/swaps,.
if exists('&undodir')
  set undodir=~/.config/nvim/undo,.
endif

" system clipboard
set clipboard=unnamedplus

" zettelkasten highlighting
hi tkLink ctermfg=Blue cterm=bold,underline guifg=blue gui=bold,underline
hi tkBrackets ctermfg=gray guifg=gray
]])
