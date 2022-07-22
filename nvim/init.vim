"" Fundamentals "{{{
" ---------------------------------------------------------------------
syntax on
set number
set hlsearch         " Подсвечивать поиск
set noswapfile       " Не создавать swp файлы

" Пробелы вместо табуляции, ширина отступа — 8 пробелов smartindent - копирует
" отступы с текущей строки при добавлении новой плюс автоматически выставляет
" отступы в «нужных» местах.
" https://habr.com/ru/post/64224/
set tabstop=8
set shiftwidth=8
set smarttab
set expandtab
set smartindent 


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
	colorscheme gruvbox
	set background=light
	let g:github_colors_soft = 0
endif

"}}}


" Extras "{{{
" ---------------------------------------------------------------------

"}}}
