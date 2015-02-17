execute pathogen#infect()
syntax on
syntax enable
if $COLORTERM == 'gnome-terminal'
	set t_Co=256
endif
set t_Co=256
filetype plugin indent on
"set background=dark
:set number
set ml
:colorscheme xoria256

vmap <C-c><C-c> :ScreenSend<CR>
nmap <C-c><C-c> vip<C-c><C-c>
nmap <C-x><C-e> :ScreenSend<CR>


autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag/plugin/closetag.vim

"set background=light
"let g:solarized_termtrans=1
"let g:solarized_termcolors=256
"let g:solarized_contrast="high"
"let g:solarized_visibility="high"
"colorscheme solarized

map <c-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>

let g:ScreenImpl="GnuScreen"

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_html_tidy_quiet_messages = { "regex" : ['proprietary','trimming' ] }

let g:CommandTWildIgnore=&wildignore . ",**/bower_components/*,**/node_modules/*,*.swp,.keep"
