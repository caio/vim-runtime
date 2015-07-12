set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

Plug 'jpythonfold.vim'

let g:ruby_operators = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }

Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'kien/rainbow_parentheses.vim', { 'for': 'clojure' }
Plug 'tpope/vim-leiningen', { 'for': 'clojure' }
Plug 'tpope/vim-projectionist', { 'for': 'clojure' }
Plug 'tpope/vim-dispatch', { 'for': 'clojure' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'guns/vim-clojure-highlight', { 'for': 'clojure' }

let g:splice_prefix = "-"
let g:splice_initial_scrollbind_grid=1
let g:splice_initial_scrollbind_loupe=1
let g:splice_initial_scrollbind_compare=1
let g:splice_initial_scrollbind_path=1

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'sjl/splice.vim'

Plug 'tpope/vim-markdown'

Plug 'caio/querycommandcomplete.vim'
au BufEnter /tmp/mutt* setlocal omnifunc=QueryCommandComplete formatoptions+=aw ft=mail tw=72
au BufEnter /tmp/mutt* let b:qcc_query_command="mutt_ldap.pl"

Plug 'tpope/vim-unimpaired'

" Bubble single lines
nmap Oa [e
nmap Ob ]e
" Bubble multiple lines
vmap Oa [egv
vmap Ob ]egv

Plug 'Zenburn'
Plug 'chriskempson/base16-vim'

Plug 'caio/jumpnextlongline.vim'
Plug 'YankRing.vim'
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/syntastic'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'renamer.vim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }

Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetDirectories=["_snippets"]

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
let g:airline#extensions#virtualenv#enabled = 1
let g:airline_theme='powerlineish'
Plug 'bling/vim-airline'

let perl_nofold_packages=1
let perl_fold=1
let perl_fold_blocks=1
Plug 'vim-perl/vim-perl', { 'for': 'perl' }

Plug 'solarnz/thrift.vim'

call plug#end()


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

" Don't reset the column when paging
set nostartofline

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

if has('gui_macvim')
    set guifont=Menlo\ Regular\ for\ Powerline:h12
endif

if &t_Co >= 256
    let base16colorspace=256
endif
colorscheme base16-tomorrow

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

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

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

" Matchit plugin
runtime macros/matchit.vim

" Manpage plugin
runtime ftplugin/man.vim
nnoremap K :Man <cword><CR>

" renamer plugin
let g:RenamerSupportColonWToRename=1

" syntastic plugin
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_enable_balloons = 1
let g:syntastic_mode_map = { 'mode': 'active',
                            \ 'active_filetypes': [],
                            \ 'passive_filetypes': ['perl', 'python', 'html'] }

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
