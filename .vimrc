set nocompatible

" minpac
" git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac
function! PackInit() abort
    packadd minpac

    call minpac#init()
    call minpac#add('k-takata/minpac', {'type': 'opt'})

    call minpac#add('easymotion/vim-easymotion')
    call minpac#add('machakann/vim-highlightedyank')
    call minpac#add('kana/vim-textobj-user')
    call minpac#add('kana/vim-textobj-entire')
    call minpac#add('tpope/vim-commentary')
    call minpac#add('udalov/kotlin-vim')
    call minpac#add('altercation/vim-colors-solarized')
    call minpac#add('tpope/vim-surround')
    call minpac#add('tpope/vim-dispatch')
    call minpac#add('tpope/vim-obsession')
    call minpac#add('tpope/vim-fugitive')
    call minpac#add('tfnico/vim-gradle')
    call minpac#add('pchurzin/vim-compiler-kotlin')
    " vim language server protocol support
    call minpac#add('prabirshrestha/vim-lsp')
endfunction
command! PackUpdate call PackInit() | call minpac#update()
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()

packadd! matchit

set encoding=utf-8

set keymap=russian-jcukenwin
set iminsert=0
set imsearch=-1

augroup my_colorshemes
    autocmd!
    autocmd ColorScheme solarized highlight! link SpecialKey NonText
augroup END
colorscheme solarized
set background=light

set nowrap
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent
set list
set listchars=tab:▸·,space:·
if has("patch-8.1.0759")
    set listchars=tab:▸·◂,space:·
end


set history=200
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
set relativenumber
set showmode
set showcmd
set cursorline
set cursorcolumn
set colorcolumn=80,120

set hidden

" vim-easymotion
let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = 'ASDGHKLQWERTYUIOPZXCVBNMFJ'
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

" vim lsp
" lsp for c/c++
" Register ccls C++ lanuage server.
if executable('ccls')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'ccls',
      \ 'cmd': {server_info->['ccls']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
      \ 'initialization_options': {'cache': {'directory': expand('~/.cache/ccls') }},
      \ 'allowlist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
      \ })
endif
" kotlin-language-server
if executable('kotlin-language-server')
    au User lsp_setup call lsp#register_server({
      \ 'name': 'kotlin-language-server',
      \ 'cmd' : {server_info->['kotlin-language-server']},
      \ 'allowlist': ['kotlin', 'kt', 'kts'],
      \ })
endif
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    "nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    "nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    " autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

"set multicursor

" Use system clipboard
set clipboard^=unnamed
if has('unnamedplus')
    set clipboard^=unnamedplus
endif

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
" nnoremap j <NOP>
" nnoremap k <NOP>
nnoremap l <NOP>
nnoremap h <NOP>
nnoremap <C-N> <NOP>
nnoremap <C-P> <NOP>

" no highlight
nnoremap <leader>ch :nohls<CR>
nnoremap <silent> <C-L> :<C-U>nohlsearch<CR><C-L>

" add line after current
nnoremap <leader>o mqo<ESC>`q
" add line before current
nnoremap <leader>O mqO<ESC>`q

nmap <leader>D :Dispatch 

if &term =~ 'xterm'
	let &t_SI = "\e[5 q" " blink bar
	let &t_SR = "\e[3 q" " blink underline
	let &t_EI = "\e[2 q" " steady block
endif
