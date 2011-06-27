set nocompatible

set number
set ruler


let g:solarized_contrast="low"    "default value is normal
let g:solarized_visibility="low"    "default value is normal
syntax enable
set background=dark
colorscheme solarized




filetype on
filetype indent on
filetype plugin on

syntax on

set tabstop=4
set shiftwidth=4

"set ofu=syntaxcomplete#Complete

"let g:SuperTabDefaultCompletionType = "<C-X><C-O>"



" set the comment :BUILD to run ant (with default options, build.xml 
" build file
function! CMM_AS_ANT_BUILD()
	:if !exists("cmm_actionscriptbuild_loaded")
		:command! Build :w !ant
		:let cmm_actionscriptbuild_loaded = 1
	:endif
endfunction

au Filetype actionscript :call CMM_AS_ANT_BUILD()



" neocomplcache
"let g:neocomplcache_enable_at_startup = 1

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>
