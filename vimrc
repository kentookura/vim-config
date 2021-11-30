"	        _
"	 __   _(_)_ __ ___  _ __ ___ 
"	 \ \ / / | '_ ` _ \| '__/ __|
"	  \ V /| | | | | | | | | (__ 
"	   \_/ |_|_| |_| |_|_|  \___|


filetype indent plugin on
let mapleader = "\\"
syntax on

au FocusGained, BufEnter * checktime
au BufRead vimrc,home.nix silent! lcd %:p:h
au BufRead vimrc.nix set filetype=nix

command! W execute 'w !sudo tee % > /dev/null' <bar> edit!
nnoremap ! :!
inoremap <C-@> <C-o>

try
  set undodir=~/.vim_runtime/temp_dirs/undodir
  set undofile
endtry

" open help vertically
command! -nargs=* -complete=help Help vertical belowright help <args>
autocmd FileType help wincmd L
	
let g:ackprg = 'ag --vimgrep'
let javaScript_fold=1


"-------------------------------------visual-------------------------------
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

nnoremap c* /\<<C-R>=expand('<cword>')<CR>\>/C<CR>``cgn
nnoremap c# ?\<<C-R>=expand('<cword>')<CR>\>/C<CR>``cgN

function! VisualSelection(direction, extra_filter) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", "\\/.*'$^~[]")
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'gv'
      call CmdLine("Ack '" . l:pattern . "' " )
  elseif a:direction == 'replace'
      call CmdLine("%s" . '/'. l:pattern . '/')
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

"-------------------------------------remaps-------------------------------

" movement
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

inoremap <C-H> <C-o>h
inoremap <C-J> <C-o>j
inoremap <C-K> <C-o>k
inoremap <C-L> <C-o>l


map <silent> <leader><cr> :noh<cr>

map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabonlose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * g:lasttab = tabpagenr()

map <leader>cd :cd %:p:h<cr>:pwd<cr>
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gs :G<CR>
nmap gn :bn<CR>
nmap gp :bp<CR>
nmap gd :bd<CR>

inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>a

nnoremap - :vertical resize -5<CR>
nnoremap = :vertical resize +5<CR>

map <C-f> :Files<CR>
map <C-b> :Buffers<CR>

map <Leader>s :SyntasticToggleMode<CR>

"----------------------------------autocmds--------------------------------
autocmd vimenter * ++nested colorscheme gruvbox
let g:gruvbox_contrast_dark = 'medium'
let g:gruvbox_termcolors = 256

autocmd VimLeave *.tex !texclear %
autocmd BufEnter xmenu* setlocal noexpandtab tabstop=4
autocmd VimEnter * wincmd p
map <C-g> :Goyo<CR>
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight

"----------------------------------syntax----------------------------------
autocmd BufNewFile,BufRead *.md set conceallevel=0
autocmd BufNewFile,BufRead *.md let maplocalleader = "\\"
autocmd BufNewFile,BufRead *.tex let maplocalleader = "\\"
autocmd BufNewFile,BufRead *.config set syntax=sh
autocmd BufNewFile,BufRead *.conf set syntax=sh
autocmd BufNewFile,BufRead *.cfg set syntax=sh
autocmd BufNewFile,BufRead *.rc set syntax=sh
autocmd BufNewFile,BufRead *.shellrc set syntax=sh
autocmd BufNewFile,BufRead .xinitrc set syntax=sh
autocmd BufNewFile,BufRead xmobar* set syntax=haskell
autocmd BufRead xmonad.hs set foldmethod=marker
autocmd BufNewFile,BufRead *.md set tabstop=4

"----------------------------markdown/pandoc------------------------------
augroup panoc_syntax
  au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

let g:markdown_fenced_languages = ['html', 'haskell']
let g:vim_markdown_math=1
let g:vim_markdown_frontmatter=1

let g:goyo_height = 100

let g:fzf_preview_window = ''	
let g:fzf_buffers_jump = 1	
let $FZF_DEFAULT_OPTS='--reverse'

let g:limelight_conceal_ctermfg = 'gray'

