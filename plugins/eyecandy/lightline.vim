let g:lightline = {
	\ 'colorscheme': 'gruvbox',
	\ 'separator': { 'left': '▓▒░', 'right': '░▒▓'  },
	\ 'subseparator': { 'left': '░', 'right': '░'  },
  \ 'active': {
  \    'left': [ [ 'mode', 'paste'  ],
  \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
  \            ],
  \    'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype', 'charvaluehex']]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'FugitiveHead',
  \ }
	\}
