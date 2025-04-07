syntax on
set number
set tabstop=4
set shiftwidth=4
set expandtab
set noswapfile
set hls 
set ruler
set ic
set smartcase
set signcolumn=yes
set t_vb=
set visualbell t_vb=
set t_Co=256

highlight StatusLine cterm=NONE ctermfg=White ctermbg=NONE
highlight StatusLineNC cterm=NONE ctermfg=Grey ctermbg=NONE

highlight TabLine cterm=NONE ctermfg=White ctermbg=NONE
highlight TabLineSel cterm=bold ctermfg=White ctermbg=NONE
highlight TabLineFill cterm=NONE ctermfg=Grey ctermbg=NONE

highlight SignColumn ctermbg=234 guibg=#181818

call plug#begin()

Plug 'scrooloose/syntastic'
Plug 'tpope/vim-sensible'
Plug 'ervandew/supertab'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }

call plug#end()

" Auto format on save
autocmd BufWritePre * :Prettier

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
nmap 0q :bd<CR>

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
