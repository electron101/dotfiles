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
" https://linuxhandbook.com/vim-indentation-tab-spaces/
" https://vim.fandom.com/wiki/Converting_tabs_to_spaces
set tabstop=8
set shiftwidth=8
set smarttab
set expandtab
set smartindent 

let mapleader=" "


" set printfont=JetBrains\ Mono\ 10
" set printencoding=2byte-koi8-r

if exists("g:neovide")
    " Put anything you want to happen only in Neovide here
    set guifont=Cascadia\ Code:h9
endif


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

" LSP-Zero обязательно вызывать имеено здесь, иначе LSP не старнует при
" запуске, а толкьо при вводе команд (:e ; :LspStart)
runtime ./after/plugin/lsp/lsp-zero.rc.lua
"}}}

" Syntax theme "{{{
" ---------------------------------------------------------------------
if exists("&termguicolors") && exists("&winblend")
	set termguicolors
endif

	set background=light
	" set background=dark

        " Gruvbox-material
        let g:gruvbox_material_background = 'hard'
        let g:gruvbox_material_foreground = 'original'
        let g:gruvbox_material_visual     = 'grey background'
        let g:gruvbox_material_menu_selection_background = 'yellow'
        let g:gruvbox_material_sign_column_background = 'none'
        let g:gruvbox_material_spell_foreground = 'none'
        let g:gruvbox_material_ui_contrast = 'high'
        " let g:gruvbox_material_colors_override = {'bg5': ['#237895', '69']}
        " colorscheme gruvbox-material

        " Gruvbox
	let g:gruvbox_bold = 0
        " colorscheme gruvbox

        " GitHub
	let g:github_colors_soft = 0
        " colorscheme github

        " Off
        " colorscheme off

        " colorscheme ancient

        " Dracula
        let g:dracula_italic = 0

        " Ayu.vim (https://github.com/ayu-theme/ayu-vim)
        let ayucolor="light"  " for light version of theme
        " let ayucolor="mirage" " for mirage version of theme
        " let ayucolor="dark"   " for dark version of theme

        " GitHub Themes For Neovim https://github.com/projekt0n/github-nvim-theme
        colorscheme github_light_high_contrast

"}}}


" Extras "{{{
" ---------------------------------------------------------------------

"}}}
