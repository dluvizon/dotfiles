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
:colorscheme zenburn

" Highlight the search term
set hlsearch

" Set up the color for extra whitespaces
:highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
" Show trailing whitespace:
:match ExtraWhitespace /\s\+$/

" Turns the filetype plugin on so we can have language specific options
:filetype plugin on
