if !exists('g:loaded_nvim_treesitter')
	echom "Not loaded treesitter"
	finish
endif

lua << EOF

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { 
    "c", 
    "cpp", 
    "cmake", 
    "make", 
    "lua", 
    "rust" 
  },
  indent = {
    enable = true,
    disable = {},
  },
  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },
  autotag = {
    enable = true,
  },
  -- For nvim-ts-rainbow plugin (https://github.com/p00f/nvim-ts-rainbow)
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
}

EOF
