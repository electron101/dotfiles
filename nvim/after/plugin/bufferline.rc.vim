lua << EOF

require("bufferline").setup {
  options = {
    numbers = function(opts)
      return string.format('%s·%s', opts.raise(opts.ordinal), opts.lower(opts.id))
    end,
    tab_size = 20,
    -- Use nvim built-in lsp
    diagnostics = "nvim_lsp",
    --- count is an integer representing total count of errors
    --- level is a string "error" | "warning"
    --- diagnostics_dict is a dictionary from error level ("error", "warning" or "info")to number of errors for each level.
    --- this should return a string
    --- Don't get too fancy as this function will be executed a lot
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = " "
        for e, n in pairs(diagnostics_dict) do
          local sym = e == "error" and "  "
            or (e == "warning" and "  " or " " )
          s = s .. n .. sym
        end
      return s
    end,
    -- Get out of the way on the left nvim-tree The location of
    offsets = {{
      filetype = "NvimTree",
      text = function()
        return vim.fn.getcwd()
      end,
      highlight = "Directory",
      text_align = "left"
    }},
    color_icons = true,
    -- separator_style = "slant"
    separator_style = "thick"
    -- separator_style = "thin"
  }
}

EOF


" These commands will navigate through buffers in order regardless of which mode you are using
" e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
nnoremap <silent>[b :BufferLineCycleNext<CR>
nnoremap <silent>]b :BufferLineCyclePrev<CR>

" These commands will move the current buffer backwards or forwards in the bufferline
nnoremap <silent><leader>+ :BufferLineMoveNext<CR>
nnoremap <silent><leader>- :BufferLineMovePrev<CR>

" These commands will sort buffers by directory, language, or a custom criteria
nnoremap <silent><leader>be :BufferLineSortByExtension<CR>
nnoremap <silent><leader>bd :BufferLineSortByDirectory<CR>
nnoremap <silent><leader>bi :lua require'bufferline'.sort_buffers_by(function (buf_a, buf_b) return buf_a.id < buf_b.id end)<CR>

" nnoremap <silent><leader>bm :lua require'bufferline'.sort_buffers_by(function (buf_a, buf_b) print(vim.inspect(buf_a)) -- add custom logic local mod_a = vim.loop.fs_stat(buf_a.path).mtime.sec local mod_b = vim.loop.fs_stat(buf_b.path).mtime.sec return mod_a > mod_b end) <CR>

" Go to buffer (for easy selection of a buffer in view)
nnoremap <silent><leader>gb :BufferLinePick<CR>

" close any single buffer
nnoremap <silent><leader>cb :BufferLinePickClose<CR>

" close all visible buffers to the left or right of the current buffer
nnoremap <silent><leader>cr :BufferLineCloseRight<CR>
nnoremap <silent><leader>cl :BufferLineCloseLeft<CR>


" You can select a buffer by it's visible position in the bufferline using the BufferLineGoToBuffer command. This means that if you have 60 buffers open but only 7 visible in the bufferline then using BufferLineGoToBuffer 4 will go to the 4th visible buffer not necessarily the 5 in the absolute list of open buffers.
"
" <- (30) | buf31 | buf32 | buf33 | buf34 | buf35 | buf36 | buf37 (24) ->
"
" Using BufferLineGoToBuffer 4 will open buf34 as it is the 4th visible buffer.
nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>
