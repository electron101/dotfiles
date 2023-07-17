local lsp = require("lsp-zero")
-- lsp.preset("recommended")
lsp.preset('lsp-compe')

lsp.ensure_installed({
    "clangd",
})

lsp.set_server_config({
    single_file_support = true,
})

lsp.on_attach(function(client, bufnr)

    client.server_capabilities.documentFormattingProvider      = true
    client.server_capabilities.documentRangeFormattingProvider = true

    -- NVIM-NAVIC --------------------------------------------------------------
    local navic = require("nvim-navic")
    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end
    ----------------------------------------------------------------------------

    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "<leader>e", function() vim.diagnostic.open_float()           end, opts)
    vim.keymap.set("n", "[d",        function() vim.diagnostic.goto_next()            end, opts)
    vim.keymap.set("n", "]d",        function() vim.diagnostic.goto_prev()            end, opts)
    vim.keymap.set("n", "<space>q",  function() vim.diagnostic.setloclist()           end, opts)

    vim.keymap.set("n", "gD",        function() vim.lsp.buf.declaration()             end, opts)
    vim.keymap.set("n", "gd",        function() vim.lsp.buf.definition()              end, opts)
    vim.keymap.set("n", "K",         function() vim.lsp.buf.hover()                   end, opts)
    vim.keymap.set("n", "gi",        function() vim.lsp.buf.implementation()          end, opts)
    vim.keymap.set("n", "<C-k>",     function() vim.lsp.buf.signature_help()          end, opts)
    vim.keymap.set("n", "<space>wa", function() vim.lsp.buf.add_workspace_folder()    end, opts)
    vim.keymap.set("n", "<space>wr", function() vim.lsp.buf.remove_workspace_folder() end, opts)
    vim.keymap.set("n", "<space>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
    vim.keymap.set("n", "<space>D",  function() vim.lsp.buf.type_definition()         end, opts)
    vim.keymap.set("n", "<space>rn", function() vim.lsp.buf.rename()                  end, opts)
    vim.keymap.set("n", "<space>ca", function() vim.lsp.buf.code_action()             end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol()      end, opts)
    vim.keymap.set("n", "<space>gr", function() vim.lsp.buf.references()              end, opts)

end)

-- Пока не указал кодировку всё время вылазило это предупреждение warning:
-- multiple different client offset_encodings detected for buffer, this is not supported yet
-- https://www.reddit.com/r/neovim/comments/wmj8kb/i_have_nullls_and_clangd_attached_to_a_buffer_c/
local clangd_capabilities = vim.lsp.protocol.make_client_capabilities()
clangd_capabilities.offsetEncoding = "utf-8"
lsp.configure("clangd", {
    capabilities = clangd_capabilities,
})

lsp.setup()





--===================================================================================
-- НАСТРОЙКА ПЛАГИНОВ ---------------------------------------------------------------
--===================================================================================

---
-- LSP SIGNATURE
---
require "lsp_signature".setup({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
        border = "rounded"
    }
})

vim.keymap.set({ 'n' }, '<leader>l', function()
    require('lsp_signature').toggle_float_win()
end, { silent = true, noremap = true, desc = 'toggle signature' })

vim.keymap.set({ "n" }, "<Leader>k", function()
    vim.lsp.buf.signature_help()
end, { silent = true, noremap = true, desc = "toggle signature" })




---
-- CMP, Autocompletion
---
vim.opt.completeopt = { "menu", "menuone", "noselect" }

local cmp     = require("cmp")
local lspkind = require('lspkind')

-- mapping
local cmp_select   = { behavior = cmp.SelectBehavior.Insert }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<C-p>"]     = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"]     = cmp.mapping.select_next_item(cmp_select),
    ["<C-Space>"] = cmp.mapping.complete(),
    ['<CR>']      = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select   = true,
    }),
})

-- formatting
local cmp_formatting = {
    fields = { "abbr", "kind", "menu" },
    format = lspkind.cmp_format({
        mode          = "symbol_text",
        maxwidth      = 50,
        ellipsis_char = "...",
        menu = ({
            buffer        = "[Buffer]",
            nvim_lsp      = "[LSP]",
            luasnip       = "[LuaSnip]",
            nvim_lua      = "[Lua]",
            latex_symbols = "[Latex]",
        }),
    }),
}

-- sources
local cmp_sources = lsp.defaults.cmp_sources({
    { name = 'nvim_lsp_signature_help' },
})

local cmp_config = lsp.defaults.cmp_config({
    mapping    = cmp_mappings,
    formatting = cmp_formatting,
    sources    = cmp_sources,
    -- sources    = cmp_formatting,
})

cmp.setup(cmp_config)



---
-- NULL-LS 
---
local null_ls = require("null-ls")
local null_opts = lsp.build_options("null-ls", {})

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.clang_format,
        -- null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.stylua.with({
            extra_args = { "--indent-type", "Spaces", "--indent-width", "4" },
        }),
        null_ls.builtins.formatting.csharpier,
        null_ls.builtins.formatting.rustfmt,
    },
    on_attach = function(client, bufnr)
        null_opts.on_attach(client, bufnr)

        local format_opts = { bufnr = bufnr }

        if client.server_capabilities.documentFormattingProvider then
            vim.keymap.set("n", "<leader>cf", function()
                vim.lsp.buf.format(format_opts)
            end, {
                buffer = bufnr,
                silent = true,
                desc = "null-ls: Format whole file",
            })
        end

        if client.server_capabilities.documentRangeFormattingProvider then
            -- in visual mode automatically set to range?
            vim.keymap.set("x", "<leader>cf", function()
                vim.lsp.buf.format(format_opts)
            end, {
                buffer = bufnr,
                silent = true,
                desc = "null-ls: Format selected range",
            })
        end
    end,
})
