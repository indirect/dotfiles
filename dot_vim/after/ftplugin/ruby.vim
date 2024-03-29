setlocal tabstop=2
setlocal shiftwidth=2
setlocal expandtab

let b:ale_linters = ['brakeman', 'ruby', 'rubocop']
let b:ale_fixers = ['remove_trailing_lines', 'trim_whitespace', 'rubocop']
let g:ale_ruby_rubocop_executable = 'bin/rubocop'
let g:ale_ruby_brakeman_executable = 'bin/brakeman'

:compiler ruby

" Hash arrow in insert mode
inoremap <C-l> <space>=><space>

if has("gui_running")
  map <leader>t :w\|:!rspec %<cr>

  " " cmd-m and cmd-r for xmpfilter in macvim
  " nmap <buffer> <M-m> <Plug>(xmpfilter-mark)
  " xmap <buffer> <M-m> <Plug>(xmpfilter-mark)
  " imap <buffer> <M-m> <Plug>(xmpfilter-mark)
  " nmap <buffer> <M-r> <Plug>(xmpfilter-run)
  " xmap <buffer> <M-r> <Plug>(xmpfilter-run)
  " imap <buffer> <M-r> <Plug>(xmpfilter-run)
else
  map <leader>t :w\|:!rspec --color %<cr>

  " " leader-m and leader-r for xmpfilter in vim
  " nmap <buffer> <localleader>m <Plug>(xmpfilter-mark)
  " xmap <buffer> <localleader>m <Plug>(xmpfilter-mark)
  " imap <buffer> <localleader>m <Plug>(xmpfilter-mark)
  " nmap <buffer> <localleader>u <Plug>(xmpfilter-run)
  " xmap <buffer> <localleader>u <Plug>(xmpfilter-run)
  " imap <buffer> <localleader>u <Plug>(xmpfilter-run)
endif
