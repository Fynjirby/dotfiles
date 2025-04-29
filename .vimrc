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
set signcolumn=auto
set t_vb=
set visualbell t_vb=
set t_Co=256
set undofile
set undodir=~/.vim/undo
set undolevels=1000
set clipboard=unnamed

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

call plug#end()

" Auto reload gitgutter column on edits
autocmd BufWritePost,BufEnter,TextChanged,TextChangedI * GitGutter

" Open files in new tab
let g:netrw_browse_split = 3

" Keymaps
nmap H ^
nmap L $
nmap 0f :Prettier<CR>
nmap gn :tabnew<CR>
nmap gc :tabclose<CR>
nmap gid :Gvdiffsplit<CR>
nmap 0e :Ex<CR>

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
