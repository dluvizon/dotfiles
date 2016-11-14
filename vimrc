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
" Set mouse to command-line mode "
set mouse=c

" Transparent editing of gpg encrypted files.
" By Wouter Hanegraaff
augroup encrypted
  au!
 
  " First make sure nothing is written to ~/.viminfo while editing
  " an encrypted file.
  autocmd BufReadPre,FileReadPre *.gpg set viminfo=
  " We don't want a swap file, as it writes unencrypted data to disk
  autocmd BufReadPre,FileReadPre *.gpg set noswapfile
 
  " Switch to binary mode to read the encrypted file
  autocmd BufReadPre,FileReadPre *.gpg set bin
  autocmd BufReadPre,FileReadPre *.gpg let ch_save = &ch|set ch=2
  " (If you use tcsh, you may need to alter this line.)
  autocmd BufReadPost,FileReadPost *.gpg '[,']!gpg --decrypt 2> /dev/null
 
  " Switch to normal mode for editing
  autocmd BufReadPost,FileReadPost *.gpg set nobin
  autocmd BufReadPost,FileReadPost *.gpg let &ch = ch_save|unlet ch_save
  autocmd BufReadPost,FileReadPost *.gpg execute ":doautocmd BufReadPost " . expand("%:r")
 
  " Convert all text to encrypted text before writing
  " (If you use tcsh, you may need to alter this line.)
  autocmd BufWritePre,FileWritePre *.gpg '[,']!gpg --default-recipient-self -ae 2>/dev/null
  " Undo the encryption so we are back in the normal text, directly
  " after the file has been written.
  autocmd BufWritePost,FileWritePost *.gpg u
augroup END

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
"
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

" navigate to a block of code
nnoremap <leader>[ [{<CR>
nnoremap <leader>] ]}<CR>

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

" toggle vim paste mode
nmap <leader>p :set paste!<CR>

" enable modeline to be able to add (set ft=gnuc) in a file and format the
" code with diferent coding standards
set modeline

" use bash-like completion in ex mode
set wildmode=longest:list

" toggle colored right border after 80 chars
set colorcolumn=81
let s:color_column_old = 0

function! s:ToggleColorColumn()
    if s:color_column_old == 0
        let s:color_column_old = &colorcolumn
        windo let &colorcolumn = 0
    else
        windo let &colorcolumn=s:color_column_old
        let s:color_column_old = 0
    endif
endfunction

nnoremap <Leader>m :call <SID>ToggleColorColumn()<cr>

" Octave syntax
augroup filetypedetect
  au! BufRead,BufNewFile *.m,*.oct set filetype=octave
augroup END 

" Use keywords from Octave syntax language file for autocomplete
if has("autocmd") && exists("+omnifunc")
   autocmd Filetype octave
   \ if &omnifunc == "" |
   \ setlocal omnifunc=syntaxcomplete#Complete |
   \ endif
endif 

"let &printexpr="(v:cmdarg=='' ? ".
"    \"system('lpr' . (&printdevice == '' ? '' : ' -P' . &printdevice)".
"    \". ' ' . v:fname_in) . delete(v:fname_in) + v:shell_error".
"    \" : system('mv '.v:fname_in.' '.v:cmdarg) + v:shell_error)"

