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

highlight TabLine cterm=NONE ctermfg=White ctermbg=NONE
highlight TabLineSel cterm=bold ctermfg=White ctermbg=NONE
highlight TabLineFill cterm=NONE ctermfg=Grey ctermbg=NONE

call plug#begin()

Plug 'preservim/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-sensible'
Plug 'ervandew/supertab'
Plug 'tpope/vim-fugitive'

call plug#end()

" Keymaps
nnoremap gn :tabnew<CR>
nnoremap gc :tabclose<CR>
nnoremap <C-f> :NERDTreeToggle<CR>
nnoremap gid :Gvdiffsplit<CR>
" No search result highlight on Escape press
nnoremap <Esc> :noh<CR>
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
" Auto close
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
