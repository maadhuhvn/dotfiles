" --Vim Specific
:set autoindent
:set clipboard=unnamedplus
:set hlsearch
:set incsearch
:set mouse=a
:set number
:set relativenumber
:set ruler
:set scrolloff=5
":set cursorline
"colorscheme gruvbox
:set background=dark
":set laststatus=2

" --move
nnoremap K :m .-2<CR>==
nnoremap J :m .+1<CR>==
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

" --leader
let mapleader=" "

" --basics
"inoremap ;; <Esc>
nnoremap <CR> o<Esc>
nnoremap <leader><CR> O<Esc>
nnoremap U <C-R>

" --Vim Specific
nnoremap <leader>wq :wq<CR>
nnoremap <leader>e :e $MYVIMRC<CR>
nnoremap <leader>r :source $MYVIMRC<CR>

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Restore cursor to the last known position when opening a file
augroup restore_cursor_position
  autocmd!
  autocmd BufReadPost * 
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
augroup END

" Install vim-plug if not found
"let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
"if empty(glob(data_dir . '/autoload/plug.vim'))
"  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-surround'
Plug 'machakann/vim-swap'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
"Plug 'mhinz/vim-startify'

call plug#end()

autocmd vimenter * ++nested colorscheme gruvbox

