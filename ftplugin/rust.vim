let b:ale_fixers = ['rustfmt', 'trim_whitespace', 'remove_trailing_lines']
let b:ale_linters = []
let b:ale_fix_on_save = 1
let g:ale_rust_rustfmt_options = "--edition 2018"
nnoremap <leader>rt :RustTest<CR>
nnoremap <leader>rr :RustTest!<CR>
