set nocompatible
filetype off

" Vundle setup {{{
set runtimepath+=~/.vim/bundle/vundle
call vundle#rc()

" Handle itself
Bundle "gmarik/vundle"

" Github plugins
Bundle "caio/jumpnextlongline.vim"
Bundle "caio/scala-vim-support"
Bundle "chrisbra/histwin.vim"
Bundle "chrismetcalf/vim-yankring"
Bundle "ciaranm/inkpot"
Bundle "godlygeek/tabular"
Bundle "gregsexton/gitv"
Bundle "jelera/vim-javascript-syntax"
Bundle "jnwhiteh/vim-golang"
Bundle "jpalardy/vim-slime"
Bundle "kchmck/vim-coffee-script"
Bundle "kien/ctrlp.vim"
Bundle "klen/python-mode"
Bundle "Lokaltog/vim-powerline"
Bundle "majutsushi/tagbar"
Bundle "mileszs/ack.vim"
Bundle "scrooloose/syntastic"
Bundle "Shougo/neocomplcache"
Bundle "Shougo/neocomplcache-snippets-complete"
Bundle "Shougo/neocomplcache-clang"
Bundle "sjl/threesome.vim"
Bundle "tomtom/tcomment_vim"
Bundle "tpope/vim-cucumber"
Bundle "tpope/vim-fugitive"
Bundle "tpope/vim-git"
Bundle "tpope/vim-markdown"
Bundle "tpope/vim-repeat"
Bundle "tpope/vim-speeddating"
Bundle "tpope/vim-surround"
Bundle "vim-ruby/vim-ruby"
Bundle "xolox/vim-session"
Bundle "yurifury/hexHighlight"
Bundle "petdance/vim-perl"
Bundle "kana/vim-smartinput"

" Vim-Scripts plugins
Bundle "blackboard.vim"
Bundle "javacomplete"
Bundle "jpythonfold.vim"
Bundle "L9"
Bundle "mayansmoke"
Bundle "molokai"
Bundle "Perldoc.vim"
Bundle "renamer.vim"
Bundle "Specky"
Bundle "tir_black"
Bundle "Zenburn"
" }}}

filetype plugin indent on
syntax on
scriptencoding utf-8
let mapleader=','

" {{{ basic settings
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
"set completeopt=menu,preview,longest,menuone
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
" }}}

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
" }}}

" {{{ colors, fonts and gui
" Default color and background
set background=dark
colorscheme zenburn

if has("gui_running")
    colorscheme tir_black
    set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 10
    set cursorline
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
" }}}

" {{{ Faster tab navigation
nmap <silent><C-Tab> gt
imap <silent><C-Tab> <C-O>gt
nmap <silent><C-S-Tab> gT
imap <silent><C-S-Tab> <C-O>gT
" }}}

" {{{ general mappings
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
inoremap jj <ESC>
nmap <silent><leader>m :bp<CR>
nmap <silent><leader>n :bn<CR>
nnoremap <silent><CR> :nohlsearch<CR>
nnoremap <tab> %
vnoremap <tab> %
nnoremap <Space> za
vnoremap <Space> za
" Re-select block after (de)indent
vnoremap < <gv
vnoremap > >gv
" Swap ' and `
nnoremap ' `
nnoremap ` '
" Quick buffer switch
noremap <leader><leader> <C-^>
nnoremap <leader>; A;<ESC>
" }}}

" {{{ Better navigation when 'wrap' is on
nmap k gk
nmap <Up> gk
nmap j gj
nmap <Down> gj
" }}}

" {{{ spell shortcuts
nmap <leader>se :setlocal spell! spelllang=en<CR>
imap <leader>se <C-o>:setlocal spell! spelllang=en<CR>
nmap <leader>sp :setlocal spell! spelllang=pt_br<CR>
imap <leader>sp <C-o>:setlocal spell! spelllang=pt_br<CR>
" }}}

" {{{ CtrlP
let g:ctrlp_map = '<C-S-z>'
let g:ctrlp_split_window = 0
let g:ctrlp_working_path_mode = 1
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 1
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.ctrlp_cache'
let g:ctrlp_max_depth = 5
let g:ctrlp_follow_symlinks = 1
nmap <silent><leader>f :CtrlP<CR>
nmap <silent><leader>F :CtrlPCurWD<CR>
nmap <silent><leader>b :CtrlPBuffer<CR>
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

" {{{ Specky
let g:speckyRunRdocKey       = "<C-S>r"
let g:speckySpecSwitcherKey  = "<C-S>x"
let g:speckyRunSpecKey       = "<C-S>s"
let g:speckyWindowType       = 2
let g:speckyRunSpecCmd       = "rspec -r ~/.vim/bundle/Specky/ruby/specky_formatter.rb -f SpeckyFormatter"
" }}}

" {{{ Python mode
let g:pymode_options_other = 0
let g:pymode_lint_checker = "pylint"
let g:pymode_lint_cwindow = 0
let g:pymode_utils_whitespaces = 0
let g:pymode_syntax_print_as_function = 1
let g:pymode_syntax_slow_sync = 1
let g:pymode_breakpoint_key = '<leader>k'
" }}}

" {{{ Ruby mode
let g:ruby_operators = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1
" }}}

" Slime settings
let g:slime_target = "tmux"

" List trailing chars
set list
set listchars=tab:▸\ ,trail:·,precedes:…,extends:…,nbsp:‗

" Strip trailing whitespace
nmap <silent><leader>ws :%s/\s\+$//g<CR>

" Write with sudo using w!!
cmap w!! w !sudo tee % &>/dev/null

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

" Yankring
imap <leader>p <C-O>:YRShow<CR>
nmap <leader>p :YRShow<CR>
let g:yankring_history_file='.yankring_history'

" Powerline settings
let g:Powerline_symbols = 'fancy'

" Matchit plugin
runtime macros/matchit.vim

" Manpage plugin
runtime ftplugin/man.vim
nnoremap K :Man <cword><CR>

" Map Ack.vim to a faster keystroke
nnoremap <leader>a :LAck

" Better/Faster window handling
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Session plugin
let g:session_autoload=0
let g:session_autosave=1
set sessionoptions-=help

" Gitv options
let g:Gitv_WipeAllOnClose=1
let g:Gitv_OpenHorizontal=1

" renamer plugin
let g:RenamerSupportColonWToRename=1

" syntastic plugin
let g:syntastic_enable_signs=1

" tagbar plugin
let g:tagbar_usearrows = 1
nnoremap <silent><F5> :TagbarToggle<CR>

" threesome settings
let g:threesome_leader = "-"

" {{{ Non-standard syntaxes
" ANTLR3 Syntax
autocmd BufRead,BufNewFile *.g set syntax=antlr3
" StringTemplate Syntax
autocmd BufRead,BufNewFile *.stg set syntax=stringtemplate
" Markdown Syntax
autocmd! BufRead,BufNewFile *.md set ft=markdown
autocmd! BufRead,BufNewFile *.mkd set ft=markdown
autocmd! BufRead,BufNewFile *.pdc set ft=pdc
" MIPS Syntax
autocmd! BufRead,BufNewFile *.spim set ft=mips
" Augeas files
autocmd BufNewFile,BufRead *.aug set filetype=augeas
" }}}

" Close the preview window automatically
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" {{{ Neocomplcache settings
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_smart_case=1
let g:neocomplcache_enable_camel_case_completion=1
let g:neocomplcache_enable_underbar_completion=1
let g:neocomplcache_min_syntax_length=3
let g:neocomplcache_lock_buffer_name_pattern='\*ku\*'

" Define dictionary
let g:neocomplcache_dictionary_filetype_lists = {
    \'default': '',
    \'vimshell': $HOME.'/.vimshell_hist',
    \'scheme': $HOME.'/.gosh_completions'
    \}

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Use ctrl+k for snippets
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)

inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()

" <CR>: Close popup and save indent
" inoremap <expr><CR> neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" }}}

" {{{ Omni Completion
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" Heavy neocomplcache-backed completion
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
" }}}

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

" Persistent Undo
if has("persistent_undo")
    set undofile
    set undodir=/tmp,.,~/
    autocmd BufWritePre /tmp/* setlocal noundofile
endif

" {{{ titlestring
if has('title') && (has('gui_running') || &title)
    set titlestring=
    set titlestring+=%f\                     " file name
    set titlestring+=%h%m%r%w                " flags
    " working directory
    set titlestring+=\ -\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')}
endif
" }}}

if (&term =~ "xterm") && (&termencoding == "")
    set termencoding=utf-8
endif

" Source local (unversioned) configuration file
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" vim: set ts=4 sw=4 tw=79:
