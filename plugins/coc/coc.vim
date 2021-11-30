
"-----------------------------------coc-----------------------------------
" Use tab for trigger completion with characters ahead and navigate.
"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !co || getline('.')[col - 1] =~ '/s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <leader>gf <Plug>(coc-fix-current)

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
nnoremap <nowait><expr> <Up> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
nnoremap <nowait><expr> <Down> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
inoremap <nowait><expr> <Up> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
inoremap <nowait><expr> <Down> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
