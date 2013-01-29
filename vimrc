" Remove the toolbar on gvim
set guioptions-=T
" Remove the scrollbars on gvim
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=b
" Set the font for gvim
set guifont=Ubuntu\ Mono\ 13

" Set the color scheme
colorscheme zenburn

" Highlight the search term
set hlsearch

" Set up the color for extra whitespaces
highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
" Show trailing whitespace:
match ExtraWhitespace /\s\+$/

" Turns the filetype plugin on so we can have language specific options ant
" indentation
filetype plugin indent on

" Search for the tag file in the current directory and if not found, continue
" up the tree
set tags=./tags;/

" let unsaved buffers to be hidden without raising a warning
set hidden
