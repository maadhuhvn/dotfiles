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
":colorscheme codedark

" --move
nnoremap K :m .-2<CR>==
nnoremap J :m .+1<CR>==
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

" --leader
let mapleader=" "

" --basics
inoremap ;; <Esc>
nnoremap <CR> o<Esc>
nnoremap <leader><CR> O<Esc>

" --Vim Specific
nnoremap <leader>wq :wq<CR>
nnoremap <leader>e :e $MYVIMRC<CR>
nnoremap <leader>r :source $MYVIMRC<CR>

