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
filetype on
filetype indent on
filetype plugin on


" put swap files in a central location instead of all over the place
set backupdir=~/.vim/tmp,~/.tmp,~/tmp,/tmp
set directory=~/.vim/tmp,~/.tmp,~/tmp,/tmp

" enable undo sugar if it's a big enough version
if v:version >= 703
	set undodir=~/.vim/undo
	set undofile
	set undolevels=1000 "maximum number of changes that can be undone
	set undoreload=10000 "maximum number lines to save for undo on a buffer reload
endif



" for easier searching
set ignorecase
set smartcase


" for easier substition (assumme /g)
set gdefault 


" color scheme settings
let g:solarized_contrast="low"    "default value is normal
let g:solarized_visibility="low"    "default value is normal
syntax enable
set background=dark
colorscheme solarized

let mapleader = ","

" set <Leader>= to indent whole file then return to current location (thanks
" to https://github.com/nrocy/dotfiles/blob/master/.vimrc)
nnoremap <Leader>= G=gg<C-o><C-o>


" set filename completion to behave similar to bash
set wildmode=list:longest


" take a peek at what's above/below the cursor when scrolling up/down
set scrolloff=5


" disable arrow keys in normal/visual modes
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>



" set the comment :BUILD to run ant (with default options, build.xml 
" build file)
if !exists("cmm_antbuild_loaded")
    command! Build w !ant
    let cmm_antbuild_loaded = 1
endif


