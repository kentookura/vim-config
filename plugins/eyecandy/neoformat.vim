let g:neoformat_enabled_haskell=['brittany']
let g:neoformat_enabled_json=['prettier']
let g:neoformat_enabled_nix=['nixfmt']
augroup fmt
  autocmd!
  au BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
augroup END
