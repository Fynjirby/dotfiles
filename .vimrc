syntax on
set number
set background=dark
set tabstop=4
set shiftwidth=4
set expandtab
set wrap
set noswapfile
set hls
set ruler
set ic
set smartcase
set signcolumn=yes
set t_vb=
set visualbell t_vb=
set t_Co=256
set undofile
set undodir=~/.vim/undo
set undolevels=1000
set clipboard=unnamed "plus for linux

highlight StatusLine none
highlight StatusLineNC none

highlight TabLine none
highlight TabLineSel none cterm=bold
highlight TabLineFill none

highlight SignColumn none

call plug#begin()

Plug 'scrooloose/syntastic'
Plug 'tpope/vim-sensible'
Plug 'ervandew/supertab'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

" Auto reload gitgutter column on edits
autocmd BufWritePost,BufEnter,TextChanged,TextChangedI * GitGutter

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" Keymaps
let mapleader = "," 
nmap H ^
nmap L $
nmap <leader>n :tabnew<CR>
nmap <leader>c :tabclose<CR>
nmap <leader>g :Gvdiffsplit<CR>
nmap <leader>e :Ex<CR>
nmap <leader>q :bd<CR>

" Goto tab keymaps
nmap <leader>1 1gt
nmap <leader>2 2gt
nmap <leader>3 3gt
nmap <leader>4 4gt
nmap <leader>5 5gt
nmap <leader>6 6gt
nmap <leader>7 7gt
nmap <leader>8 8gt

" No search results highlight on Escape press
nmap <Esc> :noh<CR>

" Ignore arrows in insert mode
imap <Up> <Nop>
imap <Down> <Nop>
imap <Left> <Nop>
imap <Right> <Nop>

" Ignore arrows in normal mode
nmap <Up> <Nop>
nmap <Down> <Nop>
nmap <Left> <Nop>
nmap <Right> <Nop>

" Ignore arrows in visual mode
vmap <Up> <Nop>
vmap <Down> <Nop>
vmap <Left> <Nop>
vmap <Right> <Nop>
