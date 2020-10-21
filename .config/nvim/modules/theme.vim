" Just use the terminal's background color
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif

" Support True Color
if (has("termguicolors"))
    set termguicolors   " Use 24-bit (true-color)
    hi LineNr ctermbg=NONE guibg=NONE
    " set t_ZH=^[[3m
    " set t_ZR=^[[23m
    let g:onedark_hide_endofbuffer=1
    let g:onedark_terminal_italics=1
    let g:onedark_termcolors=256
endif

" Set colorscheme
set background=dark
colorscheme onedark

" Overwrite Highlight
" highlight ColorColumn ctermbg=0 guibg=lightgre
highlight link CocCursorRange IncSearch
highlight link CocHighlightText PmenuSBar

" Starter page
let g:startify_files_number = 6
let g:startify_center = 55
let g:startify_fortune_use_unicode = 1
let g:startify_custom_header = "startify#center(startify#fortune#boxed())"

" Status line
let g:lightline = {}
let g:lightline.colorscheme = 'one'
" let g:lightline.component = {
"   \   'lineinfo': '⭡ %3l:%-2v',
"   \ }
let g:lightline.component_function = {
    \   'cocstatus': 'coc#status',
    \   'currentfunction': 'CocCurrentFunction',
    \   'fugitive': 'LightlineFugitive',
    \   'method': 'NearestMethodOrFunction'
    \ }
let g:lightline.active = {
    \   'left': [[ 'mode', 'paste' ],
    \            [ 'fugitive', 'filename', 'cocstatus', 'curfunc', 'method']]
    \ }
let g:lightline.separator = { 'left': '', 'right': '' }
let g:lightline.subseparator = { 'left': "\ue0b1", 'right': "\ue0b3" }

function! LightlineFugitive()
  if exists('*FugitiveHead')
    let branch = FugitiveHead()
    return branch !=# '' ? ''.branch : ''
  endif
  return ''
endfunction

" Syntax highlight
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1

" Floaterm
let g:floaterm_width = 0.88
let g:floaterm_height = 0.88
let g:floaterm_wintitle = 0
let g:floaterm_autoclose = 1
