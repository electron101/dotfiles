" Allow to copy/paste between VIM instances
"copy the current visual selection to ~/.vbuf
vmap <Leader>y :w! ~/.vbuf<CR>
"copy the current line to the buffer file if no visual selection
nmap <Leader>y :.w! ~/.vbuf<CR>
"paste the contents of the buffer file
nmap <Leader>p :r ~/.vbuf<CR>

" Map ctrl-movement keys to window switching
map <C-k> <C-w>k
map <C-j> <C-w>j
map <C-l> <C-w>l
map <C-h> <C-w>h

" Disable higlighting search result on Esc key
nnoremap <silent> <Esc> :nohlsearch<cr>

" Alt+j and Alt+k inserts blank line above and below current line in normal mode
nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

