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

  " LSP ------------------------------------------
  Plug 'neovim/nvim-lspconfig'                     " Набор общих конфигураций для клиента Neovim, 
                                                   " встроенного в языковой сервер.
  Plug 'williamboman/nvim-lsp-installer'           " Позволяет легко управлять серверами LSP
  Plug 'hrsh7th/cmp-nvim-lsp'                      " Источник для клиента Neovim встроенного в языковой сервер.
  Plug 'hrsh7th/nvim-cmp'                          " Плагин завершения для neovim
  Plug 'hrsh7th/cmp-buffer'
  Plug 'L3MON4D3/LuaSnip'                          " Snippet Engine для Neovim
  Plug 'saadparwaiz1/cmp_luasnip'                  " Источник завершения luasnip для nvim-cmp
  Plug 'onsails/lspkind-nvim'                      " Пиктограммы(в автодополнении), похожие на vscode
  Plug 'jose-elias-alvarez/null-ls.nvim'           " (использую для автоформатирования кода)
  Plug 'tami5/lspsaga.nvim'                        " Async Lsp Finder, Code Action, Hover Doc, Rename, Preview Definition, 
                                                   " Jump Diagnostic and Show Diagnostics, Float Terminal

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
endif

Plug 'tpope/vim-fugitive'                          " Работа с git
Plug 'RRethy/vim-illuminate'                       " Выделение слова под курсором
Plug 'junegunn/vim-easy-align'                     " (выравнивание по введённмоу шаблону)
Plug 'tpope/vim-surround'                          " Обрамитель в (кавычки,',[,{ и тд)

" Плагины цветовых схем --------------------------
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'cormacrelf/vim-colors-github'

call plug#end()


" [1] - Tree-sitter — это инструмент-генератор синтаксических анализаторов и
" библиотека инкрементного синтаксического анализа. Он может построить
" конкретное синтаксическое дерево для исходного файла и эффективно обновлять
" синтаксическое дерево по мере редактирования исходного файла.

" [2] - Радужные скобки для neovim с использованием tree-sitter. Это модуль
" для nvim-treesitter, а не отдельный плагин. Требуется и настраивается через
" nvim-treesitter.
