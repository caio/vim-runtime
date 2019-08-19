let b:ale_fixers = ['rustfmt', 'trim_whitespace', 'remove_trailing_lines']
let b:ale_linters = ['rls']
let b:ale_fix_on_save = 1
nnoremap <leader>rt :RustTest<CR>
nnoremap <leader>rr :RustTest!<CR>
