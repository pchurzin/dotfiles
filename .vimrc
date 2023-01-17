" plugins to consider
" - https://github.com/machakann/vim-highlightedyank.git
" - https://github.com/easymotion/vim-easymotion.git (opt)

set nocompatible

set encoding=utf-8

filetype plugin indent on
syntax on

set visualbell

let mapleader = " "

set title

set hlsearch
set incsearch
set ignorecase
set smartcase

set number
set showmode
set showcmd

" vim-easymotion
let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = 'ASDGHKLQWERTYUIOPZXCVBNMFJ'
packadd! vim-easymotion
highlight link EasyMotionTarget ErrorMsg
highlight link EasyMotionShade  Comment
highlight link EasyMotionTarget2First ErrorMsg
highlight link EasyMotionTarget2Second ErrorMsg
highlight link EasyMotionMoveHL Search
highlight link EasyMotionIncSearch Search
map <leader>j <Plug>(easymotion-sn)
map <leader><leader>w <Plug>(easymotion-bd-w)
map <leader><leader>W <Plug>(easymotion-bd-W)
map <leader>; <Plug>(easymotion-repeat)

"set multicursor

" Use system clipboard
" set clipboard+=unnamed

inoremap <S-Space> <C-O>a
" hard mode
inoremap <BS> <NOP>
noremap <BS> <NOP>
cnoremap <BS> <NOP>
noremap <UP> <NOP>
inoremap <UP> <NOP>
noremap <DOWN> <NOP>
inoremap <DOWN> <NOP>
noremap <LEFT> <NOP>
inoremap <LEFT> <NOP>
noremap <RIGHT> <NOP>
inoremap <RIGHT> <NOP>
nnoremap j <NOP>
nnoremap k <NOP>
nnoremap l <NOP>
nnoremap h <NOP>
nnoremap <C-N> <NOP>
nnoremap <C-P> <NOP>

" no highlight
nnoremap <leader>ch :nohls<CR>
nnoremap <silent> <C-L> :<C-U>nohlsearch<CR><C-L>


if &term =~ 'xterm'
	let &t_SI = "\e[5 q" " blink bar
	let &t_SR = "\e[3 q" " blink underline
	let &t_EI = "\e[2 q" " steady block
endif
