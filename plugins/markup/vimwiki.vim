let g:vimwiki_list = [{'path': '~/wiki/',
			\ 'syntax': 'markdown', 'ext': '.md'},
	         	\ {'path': '~/hakyll-nix-template',
		        \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_conceallevel=0
let g:vimwiki_table_mappings = 0
au FileType vimwiki set syntax=markdown.pandoc
