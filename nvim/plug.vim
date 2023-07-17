if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()
"call plug#begin(stdpath('data') . '/plugged')
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

if has("nvim") 

  " LSP ------------------------------------------ {{{
  " LSP Support
  Plug 'neovim/nvim-lspconfig'                     " Набор общих конфигураций для клиента Neovim, 
                                                   " встроенного в языковой сервер.
  Plug 'williamboman/mason.nvim'                   " Optional
  Plug 'williamboman/mason-lspconfig.nvim'         " Optional

  " Autocompletion Engine
  Plug 'hrsh7th/nvim-cmp'                          " Плагин завершения для neovim
  Plug 'hrsh7th/cmp-nvim-lsp'                      " Источник для клиента Neovim встроенного в языковой сервер.
  Plug 'hrsh7th/cmp-buffer'                        "
  Plug 'hrsh7th/cmp-path'                          " 
  Plug 'saadparwaiz1/cmp_luasnip'                  " Источник завершения luasnip для nvim-cmp
  Plug 'hrsh7th/cmp-nvim-lua'
  Plug 'hrsh7th/cmp-nvim-lsp-signature-help'

  Plug 'ray-x/lsp_signature.nvim'


  " Snippets
  Plug 'L3MON4D3/LuaSnip'                          " Snippet Engine для Neovim
  Plug 'rafamadriz/friendly-snippets'              " Optional

  Plug 'onsails/lspkind-nvim'                      " Пиктограммы(в автодополнении), похожие на vscode
  Plug 'jose-elias-alvarez/null-ls.nvim'           " (использую для автоформатирования кода)
  Plug 'tami5/lspsaga.nvim'                        " Async Lsp Finder, Code Action, Hover Doc, Rename, Preview Definition, 
  Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v1.x'}
  " LSP ------------------------------------------ }}}

                                                   " Jump Diagnostic and Show Diagnostics, Float Terminal
  Plug 'SmiteshP/nvim-navic'                       " uses LSP to show your current code context

  Plug 'nvim-lualine/lualine.nvim'                 " Строка состояния
  Plug 'numToStr/Comment.nvim'                     " Комментарии в коде
  Plug 'kyazdani42/nvim-web-devicons'              " for file icons
  Plug 'kyazdani42/nvim-tree.lua'                  " Проводник файлов (вместо NerdTree)
  Plug 'akinsho/bufferline.nvim', { 'tag': '*' }   " Буфферы в виде вкладок
  Plug 'lukas-reineke/indent-blankline.nvim'       " Отступы в виде вертикальных линий
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Интерфейс для tree-sitter [1]
  Plug 'p00f/nvim-ts-rainbow'                      " Радужные скобки [2]
  Plug 'nvim-lua/plenary.nvim'                     " Библиотека lua функий (для сопрограмм)
  Plug 'nvim-telescope/telescope.nvim'             " Нечеткий поиск по спискам 
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' } " встроенный сортировщик 
                                                   " телескопа, чтобы значительно повысить 
                                                   " производительность сортировки.
  Plug 'lewis6991/gitsigns.nvim'                   " Git индикация добавленных, удаленных и измененных строк
endif

Plug 'tpope/vim-fugitive'                          " Работа с git
Plug 'RRethy/vim-illuminate'                       " Выделение слова под курсором
Plug 'junegunn/vim-easy-align'                     " (выравнивание по введённмоу шаблону)
Plug 'tpope/vim-surround'                          " Обрамитель в (кавычки,',[,{ и тд)
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }

" Плагины цветовых схем --------------------------
Plug 'rafi/awesome-vim-colorschemes'               " Collection of awesome color schemes for Vim
Plug 'flazz/vim-colorschemes'               
" ---------------------------------------
Plug 'xolox/vim-misc'
Plug 'xolox/vim-colorscheme-switcher'              " Colorscheme switcher plug 
" ---------------------------------------
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'cormacrelf/vim-colors-github'
Plug 'nanotech/jellybeans.vim'
Plug 'Mofiqul/vscode.nvim'
Plug 'arzg/vim-colors-xcode'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'fxn/vim-monochrome'
Plug 'ryanpcmcquen/true-monochrome_vim'
Plug 'sjl/badwolf'
Plug 'vim-scripts/chlordane.vim'
Plug 'tssm/c64-vim-color-scheme'
Plug 'sainnhe/edge'
Plug 'habamax/vim-pire'
Plug 'scolsen/hara'
Plug 'jaredgorski/Mies.vim'
Plug 'felipevolpone/mono-theme'
Plug 'EdenEast/nightfox.nvim'
Plug 'rebelot/kanagawa.nvim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'sainnhe/everforest'
Plug 'rose-pine/neovim'
Plug 'habamax/vim-habaurora'
Plug 'pineapplegiant/spaceduck'

call plug#end()


" [1] - Tree-sitter — это инструмент-генератор синтаксических анализаторов и
" библиотека инкрементного синтаксического анализа. Он может построить
" конкретное синтаксическое дерево для исходного файла и эффективно обновлять
" синтаксическое дерево по мере редактирования исходного файла.

" [2] - Радужные скобки для neovim с использованием tree-sitter. Это модуль
" для nvim-treesitter, а не отдельный плагин. Требуется и настраивается через
" nvim-treesitter.
