"" Fundamentals "{{{
" ---------------------------------------------------------------------
syntax on
set number
set hlsearch         " Подсвечивать поиск
set noswapfile       " Не создавать swp файлы

"}}}

" Highlights "{{{
" ---------------------------------------------------------------------
set cursorline       " Подсветка текущей строки

"}}}


" File types "{{{
" ---------------------------------------------------------------------

"}}}


" Imports "{{{
" ---------------------------------------------------------------------
runtime ./plug.vim

runtime ./maps.vim
"}}}

" Syntax theme "{{{
" ---------------------------------------------------------------------
if exists("&termguicolors") && exists("&winblend")
	set termguicolors
	colorscheme github
	set background=light
	let g:github_colors_soft = 0
endif

"}}}


" Extras "{{{
" ---------------------------------------------------------------------

"}}}
