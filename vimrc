"	        _
"	 __   _(_)_ __ ___  _ __ ___ 
"	 \ \ / / | '_ ` _ \| '__/ __|
"	  \ V /| | | | | | | | | (__ 
"	   \_/ |_|_| |_| |_|_|  \___|


filetype indent plugin on
set nocompatible
let mapleader = "\\"
syntax on
set autoread
au FocusGained, BufEnter * checktime
set laststatus=2
set clipboard+=unnamedplus
set encoding=utf-8
set fileencoding=utf-8
set foldmethod=syntax
set hidden
set nowrap
set hlsearch
set ignorecase smartcase
set expandtab ts=2 sts=2 sw=2
set autoindent
set smarttab
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2
set nobackup
set noswapfile
set nowritebackup
set number relativenumber
set path+=**
set so=10
set splitbelow
set splitright
set wildignore+=*.opus,*.flac,*.pdf,*.jpg,*.png,*.so,*.swp,*.zip,*.gzip,*.bz2,*.tar,*.xz,*.lrzip,*.lrz,*.mp3,*.ogg,*.mp4,*.gif,*.jpeg,*.webm,*.hi,*.o
set wildmenu
set lazyredraw
set magic
set showmatch
set mat=2

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

vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR></C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR></C-R>=@/<CR><CR>

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
"
syntax enable

"autocmd FileType haskell setlocal expandtab ts=2 sts=2 sw=2
"autocmd FileType json setlocal sw=2
"autocmd FileType json setlocal ts=2 sts=2 sw=2
"autocmd FileType html setlocal ts=2 sts=2 sw=2
"autocmd FileType css setlocal expandtab ts=2 sts=2 sw=2
"autocmd FileType scss setlocal expandtab ts=2 sts=2 sw=2

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

" https://stsievert.com/blog/2016/01/06/vim-jekyll-mathjax/
" Call everytime we open a Markdown file
"autocmd BufRead,BufNewFile,BufEnter *.md,*.markdown call MathAndLiquid()


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
"----------------------------------lean-----------------------------------

lua <<EOF
-- If you don't already have a preferred neovim LSP setup, you may want
-- to reference the nvim-lspconfig documentation, which can be found at:
-- https://github.com/neovim/nvim-lspconfig#keybindings-and-completion
-- For completeness (of showing this plugin's settings), we show
-- a barebones LSP attach handler (which will give you Lean LSP
-- functionality in attached buffers) here:

require('lean').setup{
  -- Enable the Lean language server(s)?
  --
  -- false to disable, otherwise should be a table of options to pass to
  --  `leanls` and/or `lean3ls`.
  --
  -- See https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#leanls for details.

  -- Lean 4
  lsp = { on_attach = on_attach },

  -- Lean 3
  lsp3 = { on_attach = on_attach },

  -- Abbreviation support
  abbreviations = {
    -- Set one of the following to true to enable abbreviations
    builtin = true, -- built-in expander
    compe = false, -- nvim-compe source
    snippets = false, -- snippets.nvim source
    -- additional abbreviations:
    extra = {
      -- Add a \wknight abbreviation to insert ♘
      --
      -- Note that the backslash is implied, and that you of
      -- course may also use a snippet engine directly to do
      -- this if so desired.
      wknight = '♘',
    },
    -- Change if you don't like the backslash
    -- (comma is a popular choice on French keyboards)
    leader = '\\',
  },

  -- Enable suggested mappings?
  --
  -- false by default, true to enable
  mappings = true,

  -- Infoview support
  infoview = {
    -- Automatically open an infoview on entering a Lean buffer?
    autoopen = true,
    -- Set the infoview windows' widths
    width = 50,
  },

  -- Progress bar support
  progress_bars = {
    -- Enable the progress bars?
    enable = true,
    -- Use a different priority for the signs
    priority = 10,
  },
}
EOF

"TreeSitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {"haskell"},
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF
