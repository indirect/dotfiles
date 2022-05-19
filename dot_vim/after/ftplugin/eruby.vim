setlocal tabstop=2
setlocal shiftwidth=2
setlocal expandtab

let b:ale_linters = ['erblint']
let b:ale_fixers = ['erblint']
let g:ale_ruby_erblint_executable = 'bin/erblint'
