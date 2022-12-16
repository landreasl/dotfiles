 " Plugins will be downloaded under the specified directory.
call plug#begin()

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'itchyny/lightline.vim'
Plug 'vifm/vifm.vim'
Plug 'ap/vim-css-color'
Plug 'bkad/CamelCaseMotion' 
Plug 'preservim/nerdtree' 
Plug 'mbbill/undotree'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

let leader = "-" 

"Makes new split window appear on right/below
set splitbelow splitright

"Default mouse-mode
set mouse=a 
nnoremap <leader>h :helpgrep<space>
"Remap split focus to CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
nnoremap <C-l> <C-w>l
noremap <space> i<space><Esc>h

"Resize window by arrow-keys
nnoremap <left> :vertica resize -2<CR> 
nnoremap <right> :vertical resize +2<CR> 
nnoremap <up> :resize -2<CR> 
nnoremap <down> :resize +2<CR> 

"Use jk to leave insert mode
inoremap jk <esc>

"Normal mode movements in insert mode
inoremap jj <c-o>j
inoremap kk <c-o>k
inoremap hh <c-o>h
inoremap ll <c-o>l
inoremap ww <c-o>w
inoremap bb <c-o>b
inoremap uu <c-o>u
inoremap $$ <c-o>$
inoremap °° <c-o>°
inoremap // \
inoremap üü <c-o>
inoremap )( {}<left>
inoremap DW <c-o>daw 
inoremap CW <c-o>caw 
inoremap DD <c-o>dd<c-o>o<up>
inoremap <esc> <nop>


"open vimrc
nnoremap öö :sp $HOME/.vimrc<cr>
nnoremap ööö :so $HOME/.vimrc<cr>

nnoremap ert :NERDTreeToggle<CR>

nnoremap aa ^
nnoremap ss $
nnoremap noo :noh<cr>

nnoremap ww :w<cr> 
nnoremap qq :q<cr>
nnoremap YYY :xa<cr>

set spell
"-----------
"Visuals
"-----------
autocmd InsertEnter * setlocal spell
autocmd InsertLeave * setlocal nospell
"-------------
"Abbreviations
"-------------
iabbrev @@    andreas-baumgaertner@gmx.de

set shortmess=filnxtToO



"highliting of last search remains
set hlsearch

"no case match
set ignorecase
"Show current line number and relative numbers
set number relativenumber
highlight LineNr ctermfg=lightgrey

"Colors
"--------------------
colorscheme slate
"Cursor blinks in insert mode
let &t_SI = "\e[1 q"
let &t_EI = "\e[2 q"

"Show Cursor line
set cursorline
autocmd InsertEnter * highlight CursorLine guibg=#000050 guifg=fg ctermbg=none
autocmd InsertLeave * highlight CursorLine guibg=#004000 guifg=fg ctermbg=239

syntax on

"Reset the cursor on start (for older versions of vim, usually not required)
augroup myCmds
au!
"autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

set expandtab
                        
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

nnoremap <C-N> :Lex!<cr>
"-------------
"Manipulation
"-------------

"Formatting paragraph
nnoremap gqj gq}gq{<c-o>

"Don't unselect after indenting
xnoremap <  <gv
xnoremap >  >gv

"Add new line without going to insert mode
nmap oo ojk
nmap OO Ojk
nmap oo ojk
nmap OO Ojk

"Search globally 
nnoremap S :%s///c<Left><Left><Left><Left><Left>



"Shorter timewindow between doublekey commands
set timeoutlen=150
set noerrorbells

"Show Macros
nnoremap mmm  :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>

"Undo in insert mode
inoremap <C-u> <ESC>ui

" Insert new blank line
nnoremap (e  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap )e  :<c-u>execute 'move +'. v:count1<cr>

"------------
"Navigation
"-----------
"Movement CamelCase
let g:camelcasemotion_key = '<leader>'
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

"Moves to position when file was closed
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \ endif

"------
"Latex
"-----

"------
"Vimrc
"------
"Source RC
nnoremap <F4> :w<cr>:so $HOME/.vimrc<cr>

"Open RC
nnoremap <F6> :sp $HOME/.vimrc<cr>


"--------
"NERDTree
"--------
nnoremap <F12> :NERDTreeFocus<CR>
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Start NERDTree. If a file is specified, move the cursor to its window.
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

"undotree to F5
nnoremap <F5> :UndotreeToggle<CR>:vertical resize -10<cr>
 
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
"-------------
"Visual Mode
"-------------

"Change Colors
hi Comment ctermfg=37
hi Operator ctermfg=202
hi Search ctermbg=134 ctermfg=black
hi Number ctermfg=120
