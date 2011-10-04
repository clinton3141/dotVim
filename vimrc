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

" so I know when a line of code is getting obese
if v:version >= 703
	set colorcolumn=80
endif

" worth a try - might get annoying, but I'd like to give it a go.
" makes line-based motions much easier at the expense of line numbers,
" but the only time I use line numbers are during debugging where a line
" number is given anyway.
if v:version >= 703
	setg relativenumber
endif

set visualbell

syntax on
syntax enable
filetype on
filetype indent on
filetype plugin on

set splitright

" netrw opens files to the right
let g:netrw_altv = 1

" might get annoying - may need to turn this off again.
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
set history=100

" for jumping around inside XML style tags
set matchpairs +=<:>

" disable the mouse, for mice are evil
set mouse=
set mousehide

" yank to OS clipboard. ("a (etc) still yanks to registers.)
set clipboard+=unnamed


" for easier searching
set ignorecase
set smartcase
set hlsearch
set incsearch


" for easier substition (assumme /g)
set gdefault 

" enable being able to go one letter past the last letter in a line
set virtualedit=onemore

" set filename completion to behave similar to bash
set wildmode=list:longest



" Folkes magic :wq in insertmode
" http://www.ashberg.de/vim/vimrc.html
function Wqtipper()
    let x = confirm("Hey!\nYou're in insert mode!\n Did you mean to <ESC>:wq?"," &Yep! \n &Don't be silly! ",1,1)
    if x == 1
        silent! wq
    endif
endfun
iab wq <bs><esc>:call Wqtipper()<CR>





" color scheme settings
if has("gui_running")
	set background=dark
	let g:solarized_contrast="high"    "default value is normal
	let g:solarized_visibility="high"    "default value is normal
	colorscheme solarized
else
	" dodgy build on a remote server complains about not being able 
	" to find colour scheme - the 'silent!' will shut it up.
	silent! colorscheme desert
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

" <Leader>s<space> saves all buffers in current window
nmap <Leader>s<Space> :wa<CR>



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







" enable undo sugar if it's a big enough version
if v:version >= 703
    set undodir=~/.vim/undo
    set undofile
    set undolevels=1000 "maximum number of changes that can be undone
    set undoreload=1000 "maximum number lines to save for undo on a buffer reload
endif



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



" move between splits with C-h, etc, rather than C-W h, really quick when you get used to it
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l


" centre current line in the buffer
" nmap <space> zz

" quicker for search and replace single chars. e.g. <Tab> r (replacement)
nmap <Tab> n


" These keys are so annoying - BE GONE WITH THEM!
map § <Esc>
imap § <Esc>
map <F1> <Esc>
imap <F1> <Esc>



" Autocommand goodness
" strip trailing whitespace on save of .js and .php files
autocmd BufWritePre *.js,*.php :call <SID>StripTrailingWhitespaces()

" from http://amix.dk/vim/vimrc.html, when vimrc is edited, reload it
autocmd! BufWritePost .vimrc source ~/.vimrc

" try to restore last known cursor position
autocmd BufReadPost * if line("'\"") | exe "normal '\"" | endif

" set pman as K binding for php files 
" (requires PEAR and pman - more info in the sidebar here: http://php.net/download-docs.php)
autocmd FileType php setlocal keywordprg=pman


" filetype hinting
au BufNewFile,BufRead *.as set filetype=actionscript




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
inoremap "" ""<Left>
inoremap ' ''<Left>
inoremap '' ''<Left>
inoremap ` ``<Left>
inoremap `` ``<Left>




" load host settings from local file (for security so that they're not listed
" on github!)
" 
" Example line in this file:
" 
" echo mapping <F5> to scp://username@host//
" map <F5> <Esc>:vsp<CR>:e scp://username@host//path/to/working/dir/<CR>
if filereadable(".vimrc.hosts")
	echo "Found hosts file, loading..."
	source ./.vimrc.hosts
else
	echo "No hosts file found"
endif
