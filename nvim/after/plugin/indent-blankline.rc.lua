require("ibl").setup({
    scope = { enabled = false },
    indent = {
        char = "│", -- https://github.com/lukas-reineke/indent-blankline.nvim/issues/282
        smart_indent_cap = true,
    },
})
