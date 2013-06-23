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

" Indent automatically depending on filetype
filetype indent on
set autoindent

" show line number
set nu

syntax on
set smartindent

" Highlight the search term
set hlsearch

" hide highlighted words from previous find
nnoremap <leader>h :nohlsearch<CR>

" Wrap text instead of being on one line
set lbr

" Set up the color for extra whitespaces
highlight ExtraWhitespace ctermbg=black guibg=lightgrey
" Show trailing whitespace:
match ExtraWhitespace /\s\+$/

" Turns the filetype plugin on so we can have language specific options ant
" indentation
filetype plugin indent on

" Search for the tag file in the current directory and if not found, continue
" up the tree
set tags=./tags;/

autocmd BufRead,BufNewFile   *.c,*.h set noic cin noexpandtab tabstop=8 shiftwidth=8
autocmd BufRead,BufNewFile   *.java set noic cin noexpandtab tabstop=4 shiftwidth=4
autocmd BufRead,BufNewFile   *.py set tabstop=4 shiftwidth=4 expandtab
autocmd BufRead,BufNewFile   *.pl syntax on

" let unsaved buffers to be hidden without raising a warning
set hidden

" let mapleader be "ç" because it's in a good position in ABNT2 keyboards
let mapleader = "ç"

" toggle spell check
nnoremap <leader>s :set spell!<CR>

" to upercase the word under the cursor
nnoremap <leader>u bgUee

" easily edit the vimrc file
nnoremap <leader>v :tabedit $MYVIMRC<CR>

" make in the current working directory
nnoremap <leader>m :make<CR>

" puts the autocmd inside a group so it does not source multiple times
augroup augroup_vimrc
	" remove all autocommands for the current group.
	autocmd!
	" sources the vimrc file when it is saved
	autocmd BufWritePost .vimrc source $MYVIMRC
	" sources the tmux configuration file when it is saved
	autocmd BufWritePost *tmux.conf execute '!tmux source-file '.expand('<afile>:p')
augroup END

" show invisible characters
nmap <leader>l :set list!<CR>

" enable modeline to be able to add (set ft=gnuc) in a file and format the
" code with diferent coding standards
set modeline

" use bash-like completion in ex mode
set wildmode=longest:list

" paint all characters after 79
highlight OverLength ctermbg=lightgrey ctermfg=lightred guibg=#FFD9D9
match OverLength /\%>79v.\+/

"let &printexpr="(v:cmdarg=='' ? ".
"    \"system('lpr' . (&printdevice == '' ? '' : ' -P' . &printdevice)".
"    \". ' ' . v:fname_in) . delete(v:fname_in) + v:shell_error".
"    \" : system('mv '.v:fname_in.' '.v:cmdarg) + v:shell_error)"

