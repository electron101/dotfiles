lua << EOF

local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting

local sources = {
	formatting.stylua,
	formatting.clang_format,
	formatting.astyle,
}

null_ls.setup({
	sources = sources, 
})

EOF
