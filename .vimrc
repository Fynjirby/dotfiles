syntax on
set number
set tabstop=4   
set shiftwidth=4   
set expandtab    
set hls 
set t_vb=
set visualbell t_vb=
set t_Co=256

highlight StatusLine cterm=NONE ctermfg=White ctermbg=NONE
highlight StatusLineNC cterm=NONE ctermfg=Grey ctermbg=NONE

call plug#begin()

Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-sensible'
Plug 'ervandew/supertab'

call plug#end()

nnoremap <C-f> :NERDTreeToggle<CR>
" Ignore arrows in insert mode
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
" Ignore arrows in normal mode
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
" Ignore arrows in visual mode
vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
