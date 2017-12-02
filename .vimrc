"pathogen
execute pathogen#infect()

set t_Co=256

syntax on
filetype plugin indent on

"turn off current highlighting =>  \ n
nnoremap <silent> <leader>n :nohlsearch<CR>

set colorcolumn=80

"size of hard tabstop
set tabstop=4

"size of an indent
set shiftwidth=4

"always use spaces instead of tabs
set expandtab

"set rtp
set rtp+=/home/fdominno/dev/src/github.com/golang/lint_delme/misc/vim

"commands
cmap w!! w !sudo tee >/dev/null %

"map <ctr>-n to open/close NERDTree
map <C-n> :NERDTreeToggle<CR>

let g:jsx_ext_required = 0

function ClearQuickfixList()
    call setqflist([])
endfunction

"sytastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=[%f]
set statusline+=[row:\ %l,\ col:\ %c]

autocmd BufWritePost,FileWritePost *.go call ClearQuickfixList() | execute 'GoLint' | cwindow

let reacton = $REACTON
if reacton == "true"
    let g:syntastic_javascript_checkers = ['eslint']
    let g:syntastic_javascript_eslint_args = ['--fix']
    set autoread
    au VimEnter *.js au BufWritePost *.js checktime
    autocmd BufWritePost *.js :checktime
else
    "map JsBeautify
    map <c-f> :call JsBeautify()<cr>
    "for js
    autocmd FileType javascript noremap <buffer> <c-f> :call JsBeautify()<cr>
    "for html
    autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
    "for css or scss
    autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
    autocmd BufWritePre *.js :call JsBeautify()
    let g:syntastic_javascript_checkers = ['jshint']
endif

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
set number

"Open NERDTree if no files specified
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:stdn_in") | NERDTree | endif

map <S-f> i <CR><ESC>

"let g:gitgutter_highlight_lines = 1
let g:gitgutter_sign_column_always = 1
let g:gitgutter_diff_base = 'master'

colorscheme zenburn_mod
