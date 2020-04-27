"------------------------------------------------------------------------------"
"                                 COLOUR SCHEME                                "
"------------------------------------------------------------------------------"
syntax enable
colorscheme molokai
:syntax enable
let g:airline_theme="powerlineish"
"------------------------------------------------------------------------------"
"                                TABS AND SPACES                               "
"------------------------------------------------------------------------------"
set autoindent
set tabstop=4
set shiftwidth=4
set noexpandtab

"------------------------------------------------------------------------------"
"                                   UI CONFIG                                  "
"------------------------------------------------------------------------------"
set number
set pastetoggle=<C-p>
filetype indent on
filetype plugin on
set relativenumber
set laststatus=2
set backspace=indent,eol,start
set showmatch
set hidden
set showcmd
set splitbelow
set splitright
set wildmenu
set cursorline
set lazyredraw
set nocompatible
set report=0

"------------------------------------------------------------------------------"
"                                    SEARCH                                    "
"------------------------------------------------------------------------------"
set smartcase
set incsearch
set hlsearch
" lets you use mouse in vim, not a good idea
set mouse=i
set <C-h> :nohlsearch<CR>

"------------------------------------------------------------------------------"
"                                   CRUTCHES                                   "
"------------------------------------------------------------------------------"
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

"------------------------------------------------------------------------------"
"                                   NERDTREE                                   "
"------------------------------------------------------------------------------"
" auto open NERDTree when opening vim
" autocmd vimenter * NERDTree
" open NERDTree using ctrl+n
" NERDTree plugin manager only works for vim 8+
map <C-n> :NERDTreeToggle<CR>
" Close vim if only window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"------------------------------------------------------------------------------"
"                                    WINDOWS                                   "
"------------------------------------------------------------------------------"
" map <C-c> :vert term<CR>
" map <C-v> :vsp<CR>
" map <C-t> gt<CR>
" remove error sounds

"------------------------------------------------------------------------------"
"                                 MISCELLANEOUS                                "
"------------------------------------------------------------------------------"
set noerrorbells visualbell t_vb=
" map 'zt' to t, where current line becomes top line
map t zt<CR> 

"------------------------------------------------------------------------------"
"                                  STATUS LINE                                 "
"------------------------------------------------------------------------------"
au InsertEnter * hi statusline guifg=black guibg=#d7afff ctermfg=black ctermbg=magenta
au InsertLeave * hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan
hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan

" Status line
" default: set statusline=%f\ %h%w%m%r\ %=%(%l,%c%V\ %=\ %P%)

" Status Line Custom
let g:currentmode={
    \ 'n'  : 'Normal',
    \ 'no' : 'Normal·Operator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V·Line',
    \ '^V' : 'V·Block',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ '^S' : 'S·Block',
    \ 'i'  : 'Insert',
    \ 'R'  : 'Replace',
    \ 'Rv' : 'V·Replace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \ 't'  : 'Terminal'
    \}

set laststatus=2
set noshowmode
set statusline=
set statusline+=%0*\ %n\                                 " Buffer number
set statusline+=%1*\ %<%F%m%r%h%w\                       " File path, modified, readonly, helpfile, preview
set statusline+=%3*│                                     " Separator
set statusline+=%2*\ %Y\                                 " FileType
set statusline+=%3*│                                     " Separator
set statusline+=%2*\ %{''.(&fenc!=''?&fenc:&enc).''}     " Encoding
set statusline+=\ (%{&ff})                               " FileFormat (dos/unix..)
set statusline+=%=                                       " Right Side
set statusline+=%2*\ col:\ %02v\                         " Colomn number
set statusline+=%3*│                                     " Separator
set statusline+=%1*\ ln:\ %02l/%L\ (%3p%%)\              " Line number / total lines, percentage of document
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}\  " The current mode

hi User1 ctermfg=007 ctermbg=239 guibg=#4e4e4e guifg=#adadad
hi User2 ctermfg=007 ctermbg=236 guibg=#303030 guifg=#adadad
hi User3 ctermfg=236 ctermbg=236 guibg=#303030 guifg=#303030
hi User4 ctermfg=239 ctermbg=239 guibg=#4e4e4e guifg=#4e4e4e

"------------------------------------------------------------------------------"
"                                   AUTOPAIRS                                  "
"------------------------------------------------------------------------------"
" let g:AutoPairsShortcutFastWrap= '<C-a>'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

"------------------------------------------------------------------------------"
"                                NERDCOMMENTING                                "
"------------------------------------------------------------------------------"
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1
