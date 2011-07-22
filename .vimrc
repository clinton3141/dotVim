" housekeeping
set nocompatible

set number
set ruler

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent

set visualbell

syntax on
syntax enable
filetype on
filetype indent on
filetype plugin on

" might get annoying - may need to turn this off again.
set autochdir

" avoid 'hit enter' prompts after remote saves (etc)
set cmdheight=3

" start vim in fullscreen mode
if has("gui_running")
    set fullscreen
endif

" remove the toolbar/icons in MacVim - makes you look more like a wizard ;)
set guioptions-=T

" take a peek at what's above/below the cursor when scrolling up/down
set scrolloff=5

" put swap files in a central location instead of all over the place
set backupdir=~/.vim/tmp,~/.tmp,~/tmp,/tmp
set directory=~/.vim/tmp,~/.tmp,~/tmp,/tmp


" remember a higher number of ex commands
set history=100

" for jumping around inside XML style tags
set matchpairs +=<:>

" disable the mouse, for mice are evil
set mouse=
set mousehide


" for easier searching
set ignorecase
set smartcase
set hlsearch

" for easier substition (assumme /g)
set gdefault 

" enable being able to go one letter past the last letter in a line
set virtualedit=onemore

" set filename completion to behave similar to bash
set wildmode=list:longest

" try to restore last known cursor position
autocmd BufReadPost * if line("'\"") | exe "normal '\"" | endif



" Folkes magic :wq in insertmode
" http://www.ashberg.de/vim/vimrc.html
function Wqtipper()
    let x = confirm("Hey!\nYou're in insert mode!\n Did you mean to <ESC>:wq?"," &Yep! \n &Don't be silly! ",1,1)
    if x == 1
        silent! wq
    else
        "???
    endif
endfun
iab wq <bs><esc>:call Wqtipper()<CR>





" color scheme settings
let g:solarized_contrast="low"    "default value is normal
let g:solarized_visibility="low"    "default value is normal
set background=dark
colorscheme solarized
if has("gui_running")
    " doesn't work in Lion currently
    " set transparency=5
endif











" LEADER KEY MAPPINGS
let mapleader = ","

" set <Leader>= to indent whole file then return to current location (thanks
" to https://github.com/nrocy/dotfiles/blob/master/.vimrc)
nnoremap <Leader>= G=gg<C-o><C-o>

" highlight searches by default, toggle search highlighting on/off easily with leader n
nmap <silent> <Leader>n :set invhls<CR>:set hls?<CR>

" leader-v to select text which was just pasted. 
nmap <Leader>v `[V`]

nnoremap <Leader>, <<
nnoremap <Leader>. >>


" OTHER KEY MAPPINGS
" disable arrow keys in normal/visual modes
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>


" up/down on lines which wrap on screen move up/down screen lines instead of
" buffer lines (thanks to @nrocy)
vnoremap j gj
vnoremap k gk
nnoremap j gj
nnoremap k gk







" enable undo sugar if it's a big enough version
if v:version >= 703
	set undodir=~/.vim/undo
	set undofile
	set undolevels=1000 "maximum number of changes that can be undone
	set undoreload=10000 "maximum number lines to save for undo on a buffer reload
endif


" set the comment :BUILD to run ant (with default options, build.xml 
" build file)
if !exists("cmm_antbuild_loaded")
    command! Build w !ant
    let cmm_antbuild_loaded = 1
endif






" other settings which I need to look into
" 
" move between splits with C-h, etc, rather than C-W h, really quick when you get used to it
" map <C-H> <C-W>h
" map <C-J> <C-W>j
" map <C-K> <C-W>k
" map <C-L> <C-W>l
"
" centre current line in the buffer
" nmap <space> zz
