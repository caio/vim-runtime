set nocompatible
filetype off

" Vundle setup
set runtimepath+=~/.vim/bundle/vundle
call vundle#rc()
Bundle "gmarik/vundle"
let g:vundle_default_git_proto = 'http'

" {{{ Python Programming
let g:pymode_options = 0
let g:pymode_lint_checker = "pylint"
let g:pymode_lint_cwindow = 0
let g:pymode_utils_whitespaces = 0
let g:pymode_syntax_print_as_function = 1
let g:pymode_syntax_slow_sync = 1
let g:pymode_breakpoint_key = '<leader>k'

Bundle "klen/python-mode"
Bundle "jpythonfold.vim"
" }}}

" {{{ Ruby Programming
" Ruby mode
let g:ruby_operators = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

Bundle "vim-ruby/vim-ruby"
" }}}

" {{{ Git Helpers
let g:splice_prefix = "-"
let g:splice_initial_scrollbind_grid=1
let g:splice_initial_scrollbind_loupe=1
let g:splice_initial_scrollbind_compare=1
let g:splice_initial_scrollbind_path=1

Bundle "tpope/vim-fugitive"
Bundle "tpope/vim-git"
Bundle "sjl/splice.vim"
" }}}

" {{{ Uncategorized
Bundle "caio/scala-vim-support"
Bundle "jnwhiteh/vim-golang"
Bundle "tpope/vim-markdown"

let g:qcc_query_command = 'mutt_ldap.pl'
Bundle "caio/querycommandcomplete.vim"
au! BufEnter /tmp/mutt* setlocal omnifunc=QueryCommandComplete

Bundle "tpope/vim-unimpaired"
" Bubble single lines
nmap Oa [e
nmap Ob ]e
" Bubble multiple lines
vmap Oa [egv
vmap Ob ]egv
" }}}

" {{{ Colorschemes
Bundle "tir_black"
Bundle "Zenburn"
Bundle "Lucius"
" }}}

" {{{ Essential
Bundle "caio/jumpnextlongline.vim"
Bundle "YankRing.vim"
Bundle "kien/ctrlp.vim"
Bundle "Lokaltog/vim-powerline"
Bundle "majutsushi/tagbar"
Bundle "scrooloose/syntastic"
Bundle "tomtom/tcomment_vim"
Bundle "tpope/vim-repeat"
Bundle "tpope/vim-surround"
Bundle "godlygeek/tabular"
Bundle "kana/vim-smartinput"
Bundle "renamer.vim"
" }}}

" {{{ Staging
Bundle "Valloric/YouCompleteMe"
Bundle "kien/rainbow_parentheses.vim"

Bundle "tpope/vim-fireplace"
Bundle "tpope/vim-classpath"
Bundle "guns/vim-clojure-static"

let g:clojure_maxlines = 1000
" }}}

" {{{ Settings
filetype plugin indent on
syntax on
scriptencoding utf-8
let mapleader=','

set mouse=a
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
set viminfo='1000,f1,:1000,/1000
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

" Persistent Undo
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
" }}}

" {{{ Colors, Fonts and GUI
set background=dark
let g:lucius_style       = "dark"
let g:lucius_contrast    = "low"
let g:lucius_contrast_bg = "normal"
colorscheme lucius
set cursorline

if has("gui_running")
    set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 10
    " FontSize plugin
    nmap <silent><A-+> :call LargerFont()<CR>
    nmap <silent><A--> :call SmallerFont()<CR>
    " Remove GUI
    set guioptions=aAe
    " extracted from script #3286
    function! LiteTabLabel()
        let label = tabpagenr().':'
        let bufnrlist = tabpagebuflist(v:lnum)

        " Add '+' if one of the buffers in the tab page is modified
        for bufnr in bufnrlist
            if getbufvar(bufnr, "&modified")
                let label .= '+ '
                break
            endif
        endfor

        " Append the buffer name
        return label . bufname(bufnrlist[tabpagewinnr(v:lnum) - 1])
    endfunction
    set guitablabel=%{LiteTabLabel()}
elseif &t_Co >= 256
    " Nothing
elseif $TERM =~ '^screen-bce'
    set t_Co=256
else
    " Nothing
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
nnoremap <silent><CR> :nohlsearch<CR>
nnoremap <Space> za
vnoremap <Space> za
nnoremap ' `
nnoremap ` '

" Quick buffer switch
noremap <leader><leader> <C-^>

" Re-select block after (de)indent
vnoremap < <gv
vnoremap > >gv
" Select pasted
nmap gV `[v`]

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
inoremap <silent><HOME> <C-O>:call <SID>SmartHome()<CR>
nnoremap <silent><HOME> :call <SID>SmartHome()<CR>
nnoremap <silent>0 :call <SID>SmartHome()<CR>
nnoremap <silent>H :call <SID>SmartHome()<CR>
nnoremap L $
" }}}

" {{{ CtrlP Settings
let g:ctrlp_map = '<C-S-z>'
let g:ctrlp_split_window = 0
let g:ctrlp_working_path_mode = 1
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 1
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_switch_buffer = 1
let g:ctrlp_max_height = 10
let g:ctrlp_dotfiles = 0
let g:ctrlp_cache_dir = $HOME.'/.ctrlp_cache'
let g:ctrlp_max_depth = 200
let g:ctrlp_follow_symlinks = 1

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](target)$',
  \ }

nmap <silent><leader>f :CtrlP<CR>
nmap <silent><leader>F :CtrlPRoot<CR>
nmap <silent><leader>b :CtrlPBuffer<CR>
nmap <silent><leader>t :CtrlPTag<CR>
nmap <silent><leader>d :CtrlPDir<CR>
" }}}

" Slime settings
let g:slime_target = "tmux"

" Yankring
imap <leader>p <C-O>:YRShow<CR>
nmap <leader>p :YRShow<CR>
let g:yankring_history_file='.yankring_history'

" Powerline settings
let g:Powerline_symbols = 'fancy'
call Pl#Theme#InsertSegment('ws_marker', 'after', 'lineinfo')

" Matchit plugin
runtime macros/matchit.vim

" Manpage plugin
runtime ftplugin/man.vim
nnoremap K :Man <cword><CR>

" renamer plugin
let g:RenamerSupportColonWToRename=1

" syntastic plugin
let g:syntastic_enable_signs=1

" tagbar plugin
let g:tagbar_usearrows = 1
nnoremap <silent><F5> :TagbarToggle<CR>

" {{{ Non-standard syntaxes
autocmd! BufRead,BufNewFile *.md set ft=markdown
autocmd! BufRead,BufNewFile *.mkd set ft=markdown
" }}}

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
