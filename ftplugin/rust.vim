let g:ale_rust_cargo_use_clippy = 1
let g:ale_rust_cargo_check_all_targets = 1

let b:ale_fixers = ['rustfmt', 'trim_whitespace', 'remove_trailing_lines']
let b:ale_fix_on_save = 1

if executable('ra_lsp_server')
    let g:ale_rust_rls_executable = 'ra_lsp_server'
    let b:ale_linters = ['cargo', 'rls']

    nmap gd :ALEGoToDefinition<CR>
    nmap fr :ALEFindReferences<CR>
    nmap K :ALEHover<CR>
endif

nnoremap <leader>rt :RustTest<CR>
nnoremap <leader>rr :RustTest!<CR>
