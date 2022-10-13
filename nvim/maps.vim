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

" Alt+n and Alt+p inserts blank line above and below current line in normal mode
nnoremap <silent><A-n> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><A-p> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Этот сценарий Vim определяет новую визуальную команду: "_j". Для выравнивания
" текста по обоим краям, требуется выделить текст в Визуальном режиме и
" выполнить команду "_j".  Подключаем макрос (идет в стандартной поставке):
source $VIMRUNTIME/macros/justify.vim


" Alt -j , Alt - k 
" быстрый способ перемещения строк текста вверх или вниз. Отображения работают
" в обычном режиме, режиме вставки и визуальном режиме, что позволяет
" перемещать текущую строку или выбранный блок строк. == изменяет отступ
" строки в соответствии с ее новым положением. Для отображений визуального
" режима gv повторно выбирает последний визуальный блок и = изменяет отступ
" этого блока.
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
