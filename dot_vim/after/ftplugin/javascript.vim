setlocal tabstop=2
setlocal shiftwidth=2
setlocal expandtab

let b:ale_fixers = ['remove_trailing_lines', 'trim_whitespace', 'eslint', 'prettier']
let b:ale_javascript_prettier_options = '--ignore-path .doesntexist'
let b:ale_javascript_eslint_options = '--no-ignore'
