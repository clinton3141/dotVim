""""""""""
" pathogen
""""""""""
filetype on
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
call pathogen#infect()

filetype on
filetype indent on
filetype plugin on

""""""""""""""
" housekeeping
""""""""""""""
set encoding=utf-8 nobomb
set nocompatible
set ruler
set shiftwidth=2 softtabstop=2 tabstop=2 smartindent autoindent expandtab
set backspace=indent,eol,start
set visualbell
set title " append filename (dir) - VIM to terminal title
set spelllang=en_gb


""""""""""""""""""""""""""""""""
" see (or don't) what's going on
""""""""""""""""""""""""""""""""
set laststatus=2
set showcmd
set lazyredraw " don't redraw during macros
set number
set colorcolumn=80
set list
set listchars=tab:›\ ,eol:¬
" syntax highlighting loveliness
syntax on
syntax enable
" avoid 'hit enter' prompts after remote saves (etc)
set cmdheight=3
" take a peek at what's above/below the cursor when scrolling up/down
set scrolloff=5
" same for left/right
set sidescrolloff=5
let g:lisp_rainbow = 1
" color scheme settings
if has("gui_running")
	let g:solarized_contrast="high"    "default value is normal
	let g:solarized_visibility="high"    "default value is normal
	syntax enable
	set background=dark
	colorscheme solarized
else
	" dodgy build on a remote server complains about not being able
	" to find colour scheme - the 'silent!' will shut it up.
	silent! colorscheme desert
endif


" http://usevim.com/2012/09/21/vim101-virtualedit/
" better for working with blocks
set virtualedit=block


""""""""""""""""""
" Search / replace
""""""""""""""""""
" for easier searching
set ignorecase
set smartcase
set hlsearch
set incsearch
" for easier substition (assumme /g)
set gdefault


""""""""""""""""""""""""""""""""""""""""""""""""""
" centralise temporary files, history memorisation
""""""""""""""""""""""""""""""""""""""""""""""""""
if exists("&undodir")
    set undodir=~/.vim/undo
    set undofile
    set undolevels=200 "maximum number of changes that can be undone
    set undoreload=100 "maximum number lines to save for undo on a buffer reload
endif

set history=50


"""""""""""""""""""
" keystroke shizzle
"""""""""""""""""""
" filename completion to behave the same as bash
set wildmenu
set wildmode=list:longest
" more sensible motions
vnoremap j gj
vnoremap k gk
nnoremap j gj
nnoremap k gk
" move between splits with C-h, etc, rather than C-W h
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
" These keys are so annoying - BE GONE WITH THEM!
map § <Esc>
imap § <Esc>
map <F1> <Esc>
imap <F1> <Esc>

" better % matching (XML tags, if/endif, while/endwhile etc)
runtime macros/matchit.vim

" disable ex mode - we live in the 21st century these days
nnoremap Q <nop>

""""""""""""""""""
" leader key stuff
""""""""""""""""""
" set leader to <SPACE> - quicker to type than \
let mapleader=" "
" highlight searches
nmap <silent> <Leader>n :set invhls<CR>:set hls?<CR>
" select text which was just pasted.
nmap <Leader>v `[V`]
" quick comment/uncommenting with TComment
map <Leader>c <c-_><c-_>
nmap <silent> <Leader>s :set spell!<CR>
" more convenient save
nnoremap <Leader>w :w<CR>

