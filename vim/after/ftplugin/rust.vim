nnoremap ,ce :!cargo run --example <C-R>=expand('%:t:r')<cr><cr>
nnoremap ,cr :!cargo run --bin <C-R>=expand('%:t:r')<cr><cr>
nnoremap ,cb :!cargo build
