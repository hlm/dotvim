let g:pathogen_disabled = []
call add(g:pathogen_disabled, 'browser-connect')
call add(g:pathogen_disabled, 'command-t')
call add(g:pathogen_disabled, 'github-issues')

execute pathogen#infect()
syntax on
syntax enable
set ts=2
set sw=2
if $COLORTERM == 'gnome-terminal'
	set t_Co=256
endif
set t_Co=256
filetype plugin indent on
"set background=dark
:set number
set ml
:colorscheme xoria256

let g:airline_powerline_fonts = 1

vmap <C-c><C-c> :ScreenSend<CR>
nmap <C-c><C-c> vip<C-c><C-c>
nmap <C-x><C-e> :ScreenSend<CR>

filetype plugin on
set omnifunc=syntaxcomplete#Complete

autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag/plugin/closetag.vim

let g:go_fmt_command = "goimports"

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

let g:acp_enableAtStartup = 0


" neocomplete {{{
  if index(g:pathogen_disabled, 'neocomplete') == -1
    let g:neocomplete#data_directory = '~/.vim/tmp/neocomplete'
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_auto_select = 1
    let g:neocomplete#enable_smart_case = 1
    let g:neocomplete#auto_completion_start_length = 2

    " increase limit for tag cache files
    let g:neocomplete#sources#tags#cache_limit_size = 16777216 " 16MB

    " fuzzy completion breaks dot-repeat more noticeably
    " https://github.com/Shougo/neocomplete.vim/issues/332
    let g:neocomplete#enable_fuzzy_completion = 0

    " always use completions from all buffers
    if !exists('g:neocomplete#same_filetypes')
      let g:neocomplete#same_filetypes = {}
    endif
    let g:neocomplete#same_filetypes._ = '_'

    " enable omni-completion for Ruby and PHP
    call neocomplete#util#set_default_dictionary(
          \'g:neocomplete#sources#omni#input_patterns', 'ruby',
          \'[^. *\t]\.\h\w*\|\h\w*::\w*')
    call neocomplete#util#set_default_dictionary(
          \'g:neocomplete#sources#omni#input_patterns',
          \'php',
          \'[^. \t]->\h\w*\|\h\w*::\w*')

    " disable for Python
    call neocomplete#util#set_default_dictionary(
          \'g:neocomplete#sources#omni#input_patterns',
          \'python',
          \'')

    " from neocomplete.txt:
    " ---------------------

    " Plugin key-mappings.
    inoremap <expr> <C-g> neocomplete#undo_completion()
    inoremap <expr> <C-l> neocomplete#complete_common_string()

    " Recommended key-mappings.
    " <CR>: cancel popup and insert newline.
    inoremap <silent> <CR> <C-r>=neocomplete#smart_close_popup()<CR><CR>
    " <TAB>: completion.
    inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr> <C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr> <BS>  neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr> <C-y> neocomplete#close_popup()
    inoremap <expr> <C-e> neocomplete#cancel_popup()
  endif
" }}}


let g:CommandTWildIgnore=&wildignore . ",**/bower_components/*,**/node_modules/*,*.swp,.keep"
let g:github_api_url = "https://github.ibm.com/api/v3/"
let g:github_access_token = $GITHUB_TOKEN
let g:github_issues_urls = ['github.ibm.com:', 'github.ibm.com/']
set rtp+=~/.fzf

nmap <leader>p :NERDTreeTabsToggle<CR>
nmap <leader>h :History<CR>
nmap <leader>g :FZF<CR>
