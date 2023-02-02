local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
  'clangd',
  'sumneko_lua',
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings,
})

lsp.set_server_config({
  single_file_support = true,
})

lsp.on_attach(function(client, bufnr)
  print('Greetings from on_attach')

  -- client.offsetEncoding = "utf-8"

  client.server_capabilities.documentFormattingProvider = true
  client.server_capabilities.documentRangeFormattingProvider = true

  local opts = {buffer = bufnr, remap = false}

  -- vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  -- vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  -- vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  -- vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  -- vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  -- vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  -- vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  -- vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  -- vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  -- vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)


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
  vim.keymap.set("n", "<space>gr", function() vim.lsp.buf.references()              end, opts)

  vim.keymap.set("n", "<space>gr", function() vim.lsp.buf.references()              end, opts)

end)

-- local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
--
-- lsp.configure('clangd', {
--   on_attach = function(client, bufnr)
--     print('hello clangd')
--     client.offsetEncoding = "utf-16"
--   end,
-- })

https://www.reddit.com/r/neovim/comments/wmj8kb/i_have_nullls_and_clangd_attached_to_a_buffer_c/
 local capabilities = vim.lsp.protocol.make_client_capabilities()
 capabilities.offsetEncoding = 'utf-8'
 require('lspconfig').clangd.setup{
        capabilities = capabilities
}

lsp.setup()

-- NULL-LS ---------------------------------------------------------------------
local null_ls = require("null-ls")
local null_opts = lsp.build_options("null-ls", {})

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.clang_format,
        -- null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.stylua.with({
            extra_args = { "--indent-type", "Spaces", "--indent-width", "4" },
        }),
    },
    on_attach = function(client, bufnr)
        null_opts.on_attach(client, bufnr)

        -- Пока не указал кодировку всё время вылазило это предупреждение warning:
        -- multiple different client offset_encodings detected for buffer, this is not supported yet
        -- https://github.com/jose-elias-alvarez/null-ls.nvim/issues/428#issuecomment-1120578988
        -- client.offset_encoding = "utf-16"

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
--------------------------------------------------------------------------------
