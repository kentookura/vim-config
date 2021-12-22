nnoremap <C-n> <cmd>CHADopen<cr>
let g:chadtree_settings = {
  \ 'xdg': v:true,
  \ 'ignore.name_exact': [],
  \ 'view': {
  \   'sort_by': [ 'is_folder', 'file_name', 'ext' ],
  \   'width': 30
  \   },
  \   'theme': {
  \     'icon_glyph_set' : 'ascii',
  \     'text_colour_set' : 'nerdtree_syntax_dark',
  \     'icon_colour_set' : 'none'
  \  }
  \}
"autocmd bufenter * if (winnr("$") == 1 && exists("b:CHADTree") && b:CHADTree.isTabTree()) | q | endif
nnoremap <Leader>t <Cmd>CHADopen<CR>
" Start CHADTree when Vim starts with a directory argument
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
\ execute 'CHADopen' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
