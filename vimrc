:if &term == "xterm"
:  if has("terminfo")
:    set t_Co=16
:    set t_AB=[%?%p1%{8}%<%t%p1%{40}%+%e%p1%{92}%+%;%dm
:    set t_AF=[%?%p1%{8}%<%t%p1%{30}%+%e%p1%{82}%+%;%dm
:  else
:    set t_Co=8
:    set t_Sf=[3%dm
:    set t_Sb=[4%dm
:  endif
:endif
: set t_kb=

:if &t_Co > 7
:  syntax on
:endif

set backspace=eol,indent,start
set autoindent

" don't highlight the last search upon startup
set viminfo="h"

" Do C-style auto indentation on C/C++/Perl/Java files only :)
:filetype on
:autocmd FileType c,cpp,perl,java :set cindent

" stop Vim from beeping all the time
set vb

set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab

set nu

set ruler
set background=dark

" uncomment to insert spaces instead of a tab when tab is pressed
set expandtab

" uncomment to use a different color map
":hi Comment   term=bold cterm=NONE ctermfg=Blue ctermbg=NONE gui=NONE guifg=Blue guibg=NONE
":hi Constant  term=underline cterm=NONE ctermfg=Red ctermbg=NONE gui=NONE guifg=Magenta guibg=NONE
":hi Special   term=bold cterm=NONE ctermfg=Magenta ctermbg=NONE gui=NONE guifg=SlateBlue guibg=NONE
":hi Identifier   term=underline cterm=NONE ctermfg=Cyan ctermbg=NONE gui=NONE guifg=Cyan guibg=NONE
":hi Statement term=bold cterm=NONE ctermfg=Yellow ctermbg=NONE gui=bold guifg=Brown guibg=NONE
":hi PreProc   term=underline cterm=NONE ctermfg=Magenta ctermbg=NONE gui=NONE guifg=Purple guibg=NONE
":hi Type      term=underline cterm=NONE ctermfg=Green ctermbg=NONE gui=bold guifg=SeaGreen guibg=NONE
":hi Underlined   term=underline cterm=underline ctermfg=Magenta gui=underline guifg=SlateBlue
":hi Ignore term=NONE cterm=NONE ctermfg=white ctermbg=NONE gui=NONE guifg=bg guibg=NONE

"Tell you if you are in insert mode
set showmode

"match parenthesis, i.e. ) with (  and } with {
set showmatch

"ignore case when doing searches
set ignorecase

"tell you how many lines have been changed
set report=0

"highlight search items
set hlsearch

" map! is for maping of keys in insert mode
" map is for maping of keys in command mode 
"####################################################
"sun 4 keypad stuff 
"for instert mode 
map! Ok +
map! Om -
map! OM 
map! [2~   0
"for command mode 
map [2~ i
map OM 
map Ok +
map Om -

"#####################################################
"other sun4 keyboard stuff 
" map F1   indent 2 spaces
map [11~ I  
"map F2   indent 2 spaces  go down to next line
map [12~ I   OB
"UNDO to  u
map [26~ u 
" OPEN to o
map [31~ o
" map FIND to /
map [33~  /
"
map [29 ~yy
map [32~ p
map [24~ .

"#####################################################
" the following are the vt102 number pad keys 
" map 8 to UP-arrow ,4 to LEFT-arrow, 6 to RIGHT-arrow,2 to DOWN-arrow
" map 1 to down-left   3 to down-right 9 to up-right 7 to up-left
"#keypad  6
map! Ov  
map Ov l
"#keypad  4
map! Ot 
map Ot h
"#keypad  2
map! Or j
map Or j
"#keypad  8
map! Ox k
map Ox k
map Ow kh
map Os jl
map Oq hj
map Oy lk
"map 5 to goto first line 
map Ou :1 
"map 0 to goto last line
map Op :$ 
map On :!
map [24~ :ex:$
map OD 
map Ot 
map ; :
map W  :wq 
map Q  :q 
"-------------------------------------------


"source $HOME/.vim/plugin/NERD_tree.vim
"source $HOME/.vim/plugin/exec_menuitem.vim
"source $HOME/.vim/plugin/fs_menu.vim
":NERDTree
"let g:NERDTreeChDirMode=2

" enable less file syntax
au BufNewFile,BufRead *.less set filetype=less

" enable twig file syntax
au BufNewFile,BufRead *.twig set filetype=twig
