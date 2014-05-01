" a lof of credit for this housekeeping section of this vimrc
" file goes to http://stevelosh.com/blog/2010/09/coming-home-to-vim/

" pathogen
" the weird off then on is to fix non-zero exit code under Mac OSX -
" http://andrewho.co.uk/weblog/vim-pathogen-with-mutt-and-git
filetype on
filetype off 
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" housekeeping
set nocompatible
set showcmd
set number
set ruler
set expandtab
set smartindent
set autoindent
set shiftwidth=2
set softtabstop=2
set tabstop=2
set encoding=utf-8 nobomb
set backspace=indent,eol,start
set laststatus=2
set visualbell
set lazyredraw " don't redraw during macros

" for easier searching
set ignorecase
set smartcase
set hlsearch
set incsearch

" for easier substition (assumme /g)
set gdefault 

" syntax highlighting loveliness
syntax on
syntax enable
filetype on
filetype indent on
filetype plugin on

" so I know when a line of code is getting obese
if v:version >= 703
	set colorcolumn=80
endif

" automatically chdir to that of the working file
if v:version >= 703
	set autochdir
endif

" avoid 'hit enter' prompts after remote saves (etc)
set cmdheight=3

" remove the toolbar/icons/scollbar - makes you look more like a wizard ;)
set guioptions-=T
set guioptions-=r

" take a peek at what's above/below the cursor when scrolling up/down
set scrolloff=5
" same for left/right
set sidescrolloff=5

" put swap files in a central location instead of all over the place
set backupdir=~/.vim/backups
set directory=~/.vim/tmp
" enable undo sugar if it's enabled
if exists("&undodir")
    set undodir=~/.vim/undo
    set undofile
    set undolevels=200 "maximum number of changes that can be undone
    set undoreload=100 "maximum number lines to save for undo on a buffer reload
endif

" remember a higher number of ex commands
set history=50

" for jumping around inside XML style tags
set matchpairs +=<:>

" disable the mouse, for mice are evil
" don't really need these anymore - have learnt to leave the mouse alone
" set mouse=
" set mousehide

" yank to OS clipboard. ("a (etc) still yanks to registers.)
set clipboard+=unnamed

" set filename completion to behave similar to bash
set wildmode=list:longest

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




" LEADER KEY MAPPINGS
" let mapleader = ","

" highlight searches by default, toggle search highlighting on/off easily with leader n
nmap <silent> <Leader>n :set invhls<CR>:set hls?<CR>

" leader-v to select text which was just pasted. 
nmap <Leader>v `[V`]

" quicker indent/outdent
nnoremap <Leader>, <<
nnoremap <Leader>. >>

" quick comment/uncommenting with TComment
map <Leader>c <c-_><c-_>

" Spell checking
set spelllang=en_gb
nmap <silent> <Leader>s :set spell!<CR>

" up/down on lines which wrap on screen move up/down screen lines instead of
" buffer lines (thanks to @nrocy)
vnoremap j gj
vnoremap k gk
nnoremap j gj
nnoremap k gk

" http://vimcasts.org/episodes/tidying-whitespace/
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

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

" AUTOCOMMAND GOODNESS
" strip trailing whitespace on save of .js and .php files
autocmd BufWritePre *.js,*.php :call <SID>StripTrailingWhitespaces()

" from http://amix.dk/vim/vimrc.html, when vimrc is edited, reload it
autocmd! BufWritePost .vimrc source ~/.vimrc

" try to restore last known cursor position
autocmd BufReadPost * if line("'\"") | exe "normal '\"" | endif

" filetype hinting
au BufNewFile,BufRead *.as set filetype=actionscript

