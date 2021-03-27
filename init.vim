"BASIC SETUP:
"Don't try to act as Vi
set nocompatible

"enable syntax and plugins (for netrw)
syntax enable
filetype plugin on

set autochdir
set path+=**
set wildmenu
set splitbelow
set splitright

call plug#begin('~/.config/nvim/plugged')

if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'christoomey/vim-tmux-navigator'
Plug 'dense-analysis/ale'
Plug 'SirVer/ultisnips'

call plug#end()
let g:ale_linters = {
	\'python': ['flake8','pylint'],
	\}
let g:ale_fixers = {
	\'python': ['autopep8'],
	\}
let g:ale_fix_on_save=1
let g:deoplete#enable_at_startup=1



inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>";
	\ <SID> check_back_space() ?  "\<TAB>";
	\ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "" {{{
	let col = col('.') - 1
	return !col || getline('.')[col - 1] =~ '\s'
endfunction ""}}}

"shows the number of the line as green
set number
colorscheme pablo
highlight LineNr ctermfg=green

nnoremap ,html :-1read $HOME/.config/nvim/.skeleton.html<CR>3jwf>a

"tab size 4
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent

" Java completion
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType java JCEnable

" Shorten error/warning flags
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
" I have some custom icons for errors and warnings but feel free to change them.
let g:ale_sign_error = '✘✘'
let g:ale_sign_warning = '⚠⚠'

" Disable or enable loclist at the bottom of vim 
" Comes down to personal preferance.
let g:ale_open_list = 0
let g:ale_loclist = 0


" Setup compilers for languages

let g:ale_linters = {
      \  'cs':['syntax', 'semantic', 'issues'],
      \  'python': ['pylint'],
      \  'java': ['javac']
      \ }
" use system clipboard
" https://anuragpeshne.github.io/essays/vim/7.html
