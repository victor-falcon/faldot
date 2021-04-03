set encoding=utf-8
set showmatch
set showcmd
set sw=2

set number
set relativenumber
set numberwidth=1
set cursorline

set mouse=a

set clipboard=unnamed

syntax enable

call plug#begin('~/.faldot/vim/plugged')

Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline'

call plug#end()

:highlight Visual cterm=reverse ctermbg=NONE

let mapleader=" "

nmap <Leader>s <Plug>(easymotion-s2)

" Nerdtree
nmap <Leader>0 :NERDTreeToggle<CR>

" TMUX Navifator
nmap <C-Right> :TmuxNavigateRight<cr>
nmap <C-Left> :TmuxNavigateLeft<cr>
nmap <C-Up> :TmuxNavigateUp<cr>
nmap <C-Down> :TmuxNavigateDown<cr>
nmap <C-x> :q<cr>
nmap <C-q> :w<cr>:q<cr>
nmap <C-s> :w<cr>
