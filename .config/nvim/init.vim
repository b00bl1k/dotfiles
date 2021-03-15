call plug#begin('~/.local/share/nvim/plugged')

Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'crusoexia/vim-monokai'

call plug#end()

syntax on
colorscheme monokai

" Auto start NERD tree when opening a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | wincmd p | endif

" Auto start NERD tree if no files are specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | exe 'NERDTree' | endif

" Let quit work as expected if after entering :q the only window left open is NERD Tree itself
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Set tabs and indents (for go)
set ts=4
set shiftwidth=4
set ai sw=4

" Replace tab with spaces
set expandtab

" enable line and column display
set ruler
set colorcolumn=80

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
" remove trailing spaces
autocmd FileType c,yaml,python autocmd BufWritePre <buffer> %s/\s\+$//e

nnoremap <silent> <Space> :NERDTreeToggle<CR>

nnoremap <C-Left> :tabprevious<CR><LF>
nnoremap <C-Right> :tabnext<CR><LF>
nnoremap <C-Up> :bn<CR>
nnoremap <C-Down> :bp<CR>

" Coc
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['flake8']}
