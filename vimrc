" a lof of credit for this housekeeping section of this vimrc
" file goes to http://stevelosh.com/blog/2010/09/coming-home-to-vim/

" pathogen
filetype off 
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" housekeeping
set nocompatible
set showcmd
set number
set ruler
set noexpandtab
set smartindent
set autoindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
set encoding=utf-8
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

" netrw to open files to the right
let g:netrw_altv = 1
set splitright

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
set backupdir=~/.vim/tmp,~/.tmp,~/tmp,/tmp
set directory=~/.vim/tmp,~/.tmp,~/tmp,/tmp

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

" enable being able to go one letter past the last letter in a line
set virtualedit=onemore

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
let mapleader = ","

" highlight searches by default, toggle search highlighting on/off easily with leader n
nmap <silent> <Leader>n :set invhls<CR>:set hls?<CR>

" leader-v to select text which was just pasted. 
nmap <Leader>v `[V`]

" quick set filetype to javascript - something I do a lot
nnoremap <Leader>j :set filetype=javascript<CR>

" quicker indent/outdent
nnoremap <Leader>, <<
nnoremap <Leader>. >>

" quick comment/uncommenting with TComment
map <Leader>c <c-_><c-_>

" Spell checking
set spelllang=en_gb
nmap <silent> <Leader>s :set spell!<CR>

" <Leader>-o to split line of text
" continue to edit the top line of the split
nmap <Leader>O i<CR><Esc>kA
" continue to edit the new line of the split
nmap <Leader>o i<CR>

" map <Leader>- to maximise active split
map <Leader>- <C-W>_

" thanks to https://github.com/davejamesmiller/linux-config/blob/master/.vimrc#L87
nmap <silent> <Leader>1t :set tabstop=1 softtabstop=1 shiftwidth=1<CR>
nmap <silent> <Leader>2t :set tabstop=2 softtabstop=2 shiftwidth=2<CR>
nmap <silent> <Leader>3t :set tabstop=3 softtabstop=3 shiftwidth=3<CR>
nmap <silent> <Leader>4t :set tabstop=4 softtabstop=4 shiftwidth=4<CR>
nmap <silent> <Leader>5t :set tabstop=5 softtabstop=5 shiftwidth=5<CR>
nmap <silent> <Leader>6t :set tabstop=6 softtabstop=6 shiftwidth=6<CR>
nmap <silent> <Leader>7t :set tabstop=7 softtabstop=7 shiftwidth=7<CR>
nmap <silent> <Leader>8t :set tabstop=8 softtabstop=8 shiftwidth=8<CR>




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

" now I'm used to these, remove them from insert mode too? (experiment!)
" the hope is to return to normal mode as often as possible.
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" up/down on lines which wrap on screen move up/down screen lines instead of
" buffer lines (thanks to @nrocy)
vnoremap j gj
vnoremap k gk
nnoremap j gj
nnoremap k gk

" quicker scroll down/up with <s-j> / <s-k> - useful for skimming through code.
" <s-j> to combine lines annoys me anyway!
" I also don't do much shell scripting, so I won't miss <s-k> opening a man page
nnoremap <s-j> 3j
nnoremap <s-k> 3k
vnoremap <s-j> 3j
vnoremap <s-k> 3k

" enable undo sugar if it's a big enough version
if v:version >= 703
    set undodir=~/.vim/undo
    set undofile
    set undolevels=200 "maximum number of changes that can be undone
    set undoreload=100 "maximum number lines to save for undo on a buffer reload
endif

if v:version >= 700
	xnoremap < <gv
	xnoremap > >gv
endif

nmap <Leader>z :GundoToggle<CR>
nmap <c-z> :GundoToggle<CR>



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


" quicker for search and replace single chars. e.g. <Tab> r (replacement)
nmap <Tab> n

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

" <F6> sorts CSS properties alphabetically
autocmd FileType css nmap <buffer> <F6> :g#\({\n\)\@<=#.,/}/sort<CR>




" Fix JSlint on OSX Lion
let $JS_CMD='node'


" auto balance braces/quotes in a variety of ways
inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {{ {
inoremap {} {}

inoremap ( ()<Left>
inoremap (<CR> (<CR>)<Esc>O
inoremap (( (
inoremap () ()

inoremap [ []<Left>
inoremap [<CR> [<CR>]<Esc>O
inoremap [[ [
inoremap [] []

inoremap " ""<Left>
inoremap "" "

inoremap ' ''<Left>
inoremap '' '

inoremap ` ``<Left>
inoremap `` `




" load host settings from local file (for security so that they're not listed
" on github!)
" 
" Example line in this file:
" 
" echo mapping <F5> to scp://username@host//
" map <F5> <Esc>:vsp<CR>:e scp://username@host//path/to/working/dir/<CR>
if filereadable(".vimrc.hosts")
	source ./.vimrc.hosts
endif
