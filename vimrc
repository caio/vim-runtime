set nocompatible
filetype off
let mapleader=','

" {{{ Plug
call plug#begin('~/.vim/plugged')

Plug 'arcticicestudio/nord-vim'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'cohama/lexima.vim'

let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'
let g:ale_set_highlights = 1
let g:ale_lint_on_enter = 0
Plug 'dense-analysis/ale'

nmap <silent> [c <Plug>(ale_previous_wrap)
nmap <silent> ]c <Plug>(ale_next_wrap)
nmap <silent> [C <Plug>(ale_previous_wrap_error)
nmap <silent> ]C <Plug>(ale_next_wrap_error)

if executable("node")
    let g:coc_start_at_startup = 0
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    inoremap <silent><expr><TAB> pumvisible() ? "\<C-y>" : "<TAB>"

    " Remap keys for gotos
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
    endfunction

    " Highlight symbol under cursor on CursorHold
    set updatetime=300
    autocmd CursorHold * silent call CocActionAsync('highlight')

    nmap <leader>rn <Plug>(coc-rename)
    nnoremap <silent><leader>d :<C-u>CocList diagnostics<cr>
endif

set ttimeoutlen=50
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_inactive_collapse=1
let g:airline_powerline_fonts=0
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#symbol = 'WS'
let g:airline#extensions#whitespace#show_message = 0
let g:airline#extensions#branch#enabled = 0
let g:airline_theme='nord'
if has("win32unix")
    let g:airline_theme='badcat'
endif
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'fatih/vim-go', { 'for': 'go' }
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"


let g:fzf_buffers_jump = 1
imap <c-x><c-f> <plug>(fzf-complete-path)
nmap <silent><leader>f :exe 'GFiles -- ' . fnamemodify(expand('%'), ':h')<CR>
nmap <silent><leader>F :GFiles<CR>
nmap <silent><leader>b :Buffers<CR>
nmap <silent><leader>t :BTags<CR>
nmap <silent><leader>T :Tags<CR>
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'


Plug 'vim-scripts/YankRing.vim'
imap <leader>P <C-O>:YRShow<CR>
nmap <leader>P :YRShow<CR>
let g:yankring_history_file='.yankring_history'

let g:RenamerSupportColonWToRename=1
let g:RenamerWildIgnoreSetting=''
Plug 'qpkorr/vim-renamer'

" Zen mode
Plug 'junegunn/goyo.vim'
let g:goyo_width = "55%"
nmap <silent><leader>z :Goyo<CR>

call plug#end()
" }}}

" {{{ Settings
filetype plugin indent on
syntax enable
scriptencoding utf-8

set mouse-=a
set nowrap
set shortmess=at
set showcmd
set showmatch
"set matchpairs+=<:>
set hlsearch
set incsearch
set ignorecase
set smartcase
set gdefault
set showfulltag
set suffixes+=.in,.a
set hidden
set scrolloff=3
set shiftwidth=4
set textwidth=79
set formatoptions=qrn1
set tabstop=8
set smarttab
set expandtab
set softtabstop=4
set autoindent
set nonumber
set viminfo='1000,f1,<500,:1000,/1000,h
set history=500
set backspace=indent,eol,start
set backup
set backupdir=./.backup,/tmp,.
set directory=.,./.backup,/tmp
set nolazyredraw
set noswapfile
set title
set noerrorbells
set novisualbell
set completeopt=menu,preview,longest,menuone
" reducing noise
set more
set cmdheight=1
set tags=tags;/
" reload file if not modified by this editor instance
set autoread
set fillchars=vert:┃
set showbreak=↪
set virtualedit+=block
set shiftround
set laststatus=2

" List trailing chars
set list
set listchars=tab:▸\ ,trail:·,precedes:…,extends:…,nbsp:‗

" Don't reset the column when paging
set nostartofline
" }}}

if has("persistent_undo")
    set undofile
    set undodir=/tmp,.,~/
    autocmd BufWritePre /tmp/* setlocal noundofile
endif

" {{{ Wildmenu
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest
set wildignore+=*.spl
set wildignore+=*.sw?
set wildignore+=*.DS_Store
set wildignore+=*.luac
set wildignore+=*.pyc
set wildignore+=*.class,*.jar
" }}}

" {{{ Appearance
set background=dark
set cursorline
if has("win32unix")
    colorscheme darkblue
else
    colorscheme nord
endif

" Titlestring
if has('title') && (has('gui_running') || &title)
    set titlestring=
    set titlestring+=%f\                     " file name
    set titlestring+=%h%m%r%w                " flags
    " working directory
    set titlestring+=\ -\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')}
endif
" }}}

" {{{ Mappings
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
inoremap jj <ESC>
nmap <silent><leader>m :bp<CR>
nmap <silent><leader>n :bn<CR>
nnoremap <silent><leader><Space> :nohlsearch<CR>
nnoremap <Space> za
vnoremap <Space> za
nnoremap ' `
nnoremap ` '

" Re-select block after (de)indent
vnoremap < <gv
vnoremap > >gv

" Spell shortcuts
nmap <leader>se :setlocal spell! spelllang=en<CR>
imap <leader>se <C-o>:setlocal spell! spelllang=en<CR>
nmap <leader>sp :setlocal spell! spelllang=pt_br<CR>
imap <leader>sp <C-o>:setlocal spell! spelllang=pt_br<CR>

" Better navigation when 'wrap' is on
nmap k gk
nmap <Up> gk
nmap j gj
nmap <Down> gj

" Write with sudo using w!!
cmap w!! w !sudo tee % &>/dev/null

" fish is not posix
if $SHELL =~ 'bin/fish'
    set shell=/usr/bin/bash
endif

" Strip trailing whitespace
nmap <silent><leader>ws :%s/\s\+$//g<CR>

" Better/Faster window handling
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" }}}

" {{{ Better folding
set foldmethod=marker
set foldlevelstart=0

function! MyFoldText()
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - 4
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction
set foldtext=MyFoldText()
" }}}

" {{{ IDE-like home key
function! s:SmartHome()
    let ll = strpart(getline('.'), -1, col('.'))
    if ll =~ '^\s\+$' | normal! 0
    else | normal! ^
    endif
endfunction
nnoremap <silent>0 :call <SID>SmartHome()<CR>
nnoremap <silent>H :call <SID>SmartHome()<CR>
nnoremap L $
" }}}

let g:netrw_sizestyle="h"
let g:netrw_banner=0
let g:netrw_list_style=3
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

" Matchit plugin
runtime macros/matchit.vim

" Close the preview window automatically
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Move to last cursor position
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" {{{ NFO
" Common code for encodings
function! SetFileEncodings(encodings)
    let b:myfileencodingsbak=&fileencodings
    let &fileencodings=a:encodings
endfunction
function! RestoreFileEncodings()
    let &fileencodings=b:myfileencodingsbak
    unlet b:myfileencodingsbak
endfunction

" .NFO specific
au BufReadPre *.nfo call SetFileEncodings('cp437')|set ambiwidth=single
au BufReadPost *.nfo call RestoreFileEncodings()
" }}}

if (&term =~ "xterm") && (&termencoding == "")
    set termencoding=utf-8
endif

" Source local (unversioned) configuration file
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" vim: set ts=4 sw=4 tw=79:
