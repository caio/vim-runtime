" Simple VI configuration file
" Caio Romão <caioromao@gmail.com>

scriptencoding utf-8

syntax on

" setting up pathogen
filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

let mapleader=','

" {{{ basic settings
set mouse=a
set nowrap
set nocompatible
set shortmess=a
set showcmd
set showmatch
"set matchpairs+=<:>
set hlsearch
set incsearch
set ignorecase
set smartcase
set gdefault
set showfulltag
set wildmenu
set wildmode=list:longest
set wildignore+=*.o,*~,.lo,*.pyc
set suffixes+=.in,.a
set hidden
set shiftwidth=4
set textwidth=79
set formatoptions=qrn1
set tabstop=8
set smarttab
set expandtab
set softtabstop=4
set autoindent
set smartindent
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
set cmdheight=2
" }}}

" {{{ colors, fonts and gui
if has("gui_running")
    colorscheme mustang
    set guifont=Envy\ Code\ R\ 10
    if v:version > 702
        set relativenumber
    else
        set number
    endif
    set cursorline
    " FontSize plugin
    nmap <silent><A-+> :call LargerFont()<CR>
    nmap <silent><A--> :call SmallerFont()<CR>
    " Remove GUI
    set guioptions=aAe
    " extracted from script #3286
    function LiteTabLabel()
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
    " mayansmoke settings
    let g:mayansmoke_special_key_visibility=2
    let g:mayansmoke_cursor_line_visibility=2
elseif &t_Co >= 256
    colorscheme herald
elseif $TERM =~ '^screen-bce'
    set t_Co=256
    colorscheme vitamins
else
    colorscheme blackboard
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
nmap <silent><leader>N :bp<CR>
nmap <silent><leader>n :bn<CR>
imap <silent><leader>N <C-o>:bp<CR>
imap <silent><leader>n <C-o>:bn<CR>
imap  
nmap  
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <tab> %
vnoremap <tab> %
nnoremap / /\v
vnoremap / /\v
" Re-select block after (de)indent
vnoremap < <gv
vnoremap > >gv
inoremap jj <ESC>
" }}}

" {{{ Better navigation when 'wrap' is on
nmap k gk
nmap <Up> gk
nmap j gj
nmap <Down> gj
" }}}

" {{{ spell shortcuts
nmap <F7> :setlocal spell! spelllang=en<CR>
imap <F7> <C-o>:setlocal spell! spelllang=en<CR>
nmap <F8> :setlocal spell! spelllang=pt_br<CR>
imap <F8> <C-o>:setlocal spell! spelllang=pt_br<CR>
" }}}

" {{{ Fuzzy Finder
nmap <silent><leader>f :FufFile<CR>
nmap <silent><leader>d :FufDir<CR>
nmap <silent><leader>b :FufBuffer<CR>
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


" List trailing chars
set list
set listchars=tab:▸\ ,trail:.,extends:#,nbsp:.
nmap <silent> <leader>s :set nolist!<CR>

" Strip trailing whitespace
nmap <silent><leader>ws :%s/\s\+$//g<CR>

" {{{ IDE-like home key
function! s:SmartHome()
    let ll = strpart(getline('.'), -1, col('.'))
    if ll =~ '^\s\+$' | normal! 0
    else | normal! ^
    endif
endfunction
inoremap <silent><HOME> <C-O>:call <SID>SmartHome()<CR>
nnoremap <silent><HOME> :call <SID>SmartHome()<CR>
" }}}

" Supertab
let g:SuperTabDefaultCompletionType='context'

" Yankring
imap <leader>p <C-O>:YRShow<CR>
nmap <leader>p :YRShow<CR>
let g:yankring_history_file='.yankring_history'

" TOhtml options
let html_number_lines=1
let html_use_css=1
let use_xhtml=1

" {{{ Number Marks
map <silent> <unique> mm <Plug>Place_sign
map <silent> <unique> mb <Plug>Goto_next_sign
map <silent> <unique> mv <Plug>Goto_prev_sign
map <silent> <unique> mdd <Plug>Remove_all_signs
map <silent> <unique> m. <Plug>Move_sign
" }}}

" Matchit plugin
runtime macros/matchit.vim

" Manpage plugin
runtime ftplugin/man.vim
nnoremap K :Man <cword><CR>

" Map Ack.vim to a faster keystroke
nnoremap <leader>a :Ack

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

" Python synxtax file
let python_highlight_all=1
let python_slow_sync=1
let python_print_as_function=1

" {{{ Non-standard syntaxes
" ANTLR3 Syntax
autocmd BufRead,BufNewFile *.g set syntax=antlr3
" StringTemplate Syntax
autocmd BufRead,BufNewFile *.stg set syntax=stringtemplate
" Markdown Syntax
autocmd! BufRead,BufNewFile *.md set ft=mkd
autocmd! BufRead,BufNewFile *.mkd set ft=mkd
autocmd! BufRead,BufNewFile *.pdc set ft=pdc
" MIPS Syntax
autocmd! BufRead,BufNewFile *.spim set ft=mips
" }}}

" Close the preview window automatically
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Enabling Django snippets
autocmd FileType python set ft=python.django
autocmd FileType html set ft=html.django_template

" Auto save when focus is lost
autocmd FocusLost * :wa

" Augeas files
autocmd BufNewFile,BufRead *.aug set filetype=augeas

" Neocomplcache settings {{{
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_smart_case=1
let g:neocomplcache_enable_underbar_completion=1
let g:neocomplcache_auto_completion_start_length=3
let g:neocomplcache_manual_completion_start_length=1

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" SuperTab like snippets behavior.
imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Use ctrl+k for snippets
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" }}}

" {{{ Omni Completion
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" }}}

" {{{ Testing autocmds
" Google's JSLint
au BufNewFile,BufRead *.js set makeprg=gjslint\ %
au BufNewFile,BufRead *.js set errorformat=%-P-----\ FILE\ \ :\ \ %f\ -----,Line\ %l\\,\ E:%n:\ %m,%-Q,%-GFound\ %s,%-GSome\ %s,%-Gfixjsstyle%s,%-Gscript\ can\ %s,%-G
" Nose
au BufNewFile,BufRead test_*.py set makeprg=nosetests\ --machine-out\ --nocapture
au BufNewFile,BufRead test_*.py set shellpipe=2>&1\ >/dev/null\ \|\ tee
au BufNewFile,BufRead test_*.py set errorformat=%f:%l:\ %m
au BufNewFile,BufRead test_*.py nmap <silent> <leader>m <Plug>MakeGreen
au BufNewFile,BufRead test_*.py nmap <leader>M :make<cr>
" }}}

" Persistent Undo
if v:version > 702
    set undofile
    set undodir=/tmp,.,~/
    autocmd BufWritePre /tmp/* setlocal noundofile
endif

" {{{ statusline
set laststatus=2
set statusline=%2*
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=\[%{strlen(&ft)?&ft:'-'},    " filetype
set statusline+=%{&enc},                     " encoding
set statusline+=%{&ff}]\                     " file format
set statusline+=0x%B\                        " current char
set statusline+=%l,%c\ %O,%P                 " line, column, offset
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

" vim: set ts=4 sw=4 tw=72:
