" Starting set
set backspace=indent,eol,start
set hls
set autoindent
set number
set ruler
set laststatus=2

" Vimplug
call plug#begin('~/.vim/plugged')
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'junegunn/seoul256.vim'

Plug 'tpope/vim-vinegar'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'
call plug#end()

" Colors
syntax on
let g:seoul256_background = 236
colo seoul256

" Fix for kitty bg colors
let &t_ut=''

" Keymaps

" Statusline
set statusline=
set statusline+=%#PmenuSel#
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\
" Hide statusline when fzf in buffer
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
