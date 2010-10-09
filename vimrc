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
set showfulltag
set wildmenu
set wildmode=list:longest
set wildignore+=*.o,*~,.lo,*.pyc
set suffixes+=.in,.a
set hidden
set shiftwidth=4
set tabstop=4
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
set foldmethod=marker
set completeopt=menu,preview,longest,menuone
" reducing noise
set more
set cmdheight=2
" }}}

" {{{ colors, fonts and gui
if has("gui_running")
    set guifont=Envy\ Code\ R\ 10
    colorscheme vitamins
    set number
    set cursorline
    " FontSize plugin
    nmap <silent><A-+> :call LargerFont()<CR>
    nmap <silent><A--> :call SmallerFont()<CR>
    " Remove GUI
    set guioptions=aAe
    set guitablabel=%(%m\ %)%f
    " mayansmoke settings
    let g:mayansmoke_special_key_visibility=2
    let g:mayansmoke_cursor_line_visibility=2
else
    set t_Co=256
    colorscheme herald
endif
" }}}

" {{{ Faster tab navigation
nmap <silent><C-Tab> gt
imap <silent><C-Tab> <C-O>gt
nmap <silent><C-S-Tab> gT
imap <silent><C-S-Tab> <C-O>gT
" }}}

" {{{ general mappings
nmap <silent> <F3> :silent nohlsearch<CR>
imap <silent> <F3> <C-o>:silent nohlsearch<CR>
nmap <silent><leader>N :bp<CR>
nmap <silent><leader>n :bn<CR>
imap <silent><leader>N <C-o>:bp<CR>
imap <silent><leader>n <C-o>:bn<CR>
imap  
nmap  
" Re-select block after (de)indent
vnoremap < <gv
vnoremap > >gv
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
nmap <silent><leader>t :FufTag<CR>
nmap <silent><leader>d :FufDir<CR>
imap <silent><leader>b <C-O>:FufBuffer<CR>
nmap <silent><leader>b :FufBuffer<CR>
" }}}

" List trailing chars
set listchars=tab:\➜\ ,trail:·,nbsp:-
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
au BufRead,BufNewFile *.g set syntax=antlr3
" StringTemplate Syntax
au BufRead,BufNewFile *.stg set syntax=stringtemplate
" Markdown Syntax
au! BufRead,BufNewFile *.md set ft=mkd
au! BufRead,BufNewFile *.mkd set ft=mkd
au! BufRead,BufNewFile *.pdc set ft=pdc
" MIPS Syntax
au! BufRead,BufNewFile *.spim set ft=mips
" }}}

" Close the preview window automatically
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Enabling Django snippets
autocmd FileType python set ft=python.django
autocmd FileType html set ft=html.django_template

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
"
if (&term =~ "xterm") && (&termencoding == "")
    set termencoding=utf-8
endif

" vim: set ts=4 sw=4 tw=72:
