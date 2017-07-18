""""""""""""""""""""""""""""""""""""
"       ALI'S VIM CONFIG           "
""""""""""""""""""""""""""""""""""""

"----------------------------------
"" Plugins
"----------------------------------

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Syntasitc (syntax highlighter)
Plugin 'scrooloose/syntastic'

" Airline tag plugin
Plugin 'bling/vim-airline'

" Snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"--------------------------
" Don't let it wrap text
set nowrap

" Better commandline completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" " mapping of <C-L> below)
set hlsearch

" set modifiable buffer
set modifiable

"--------------------------
"" Usability options 1
"--------------------------

"" These are options that users frequently set in their .vimrc. Some of them change Vim's behaviour
" in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Set the history of commands
set history=1000

" Set number of lines
set lines=75

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Set paste option toggle when copying from system
set pastetoggle=<F10>

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Set line numbering 
set number

" Set syntax highlighting
syntax enable

" Make the 81st column stand out
highlight ColorColumn ctermbg=magenta
" regex you are at the first line virtually 
call matchadd('ColorColumn', '\%81v', 100)

" Show trailing tabs and white spaces
set listchars=tab:>~,nbsp:_,trail:. 
set list

" Add spell check to document
nnoremap <Leader>SC :setlocal spell spelllang=en_gb<enter>

" Remap ; to :
nnoremap ; :
nnoremap : ;

" Explore settings
"-----------------

" Open explorer
nnoremap E :Explore<enter>

" Open explorer in horizontal split
nnoremap HE :Hexplore<enter>

" Open explorer in vertical split
nnoremap VE :Vexplore<enter>

" The list view style
let g:netrw_liststyle=3

" Remove the banner
let g:netrw_banner=0

" Open the file in vertical split
let g:netrw_browse_split=2

" Set the window size
let g:netrw_winsize=30

" Grep settings
"---------------
:nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>

" Map F6 to sync project changes to dev servevr
"nnoremap <silent> <F6> :vsp<CR>:! ~/svn/starred-utl/client/dev_sync.sh alistair /Users/user/svn/<cr>
"nnoremap <silent> <F6> :! ~/svn/starred-utl/client/dev_sync.sh alistair /Users/user/svn/<cr>

" Remap S to :w (save) as S is the same as cc
nnoremap S :w<enter>

" Set syntax to markdown
nnoremap MD :set syntax=markdown

" Set md filetype as markdown
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" Set hbs filetype
au BufNewFile,BufFilePre,BufRead *.hbs set filetype=html

" Map leader II to insert image snippet
nnoremap <Leader>II \insert ![](img/)

" remap :cl to console log depending on file type, show appropiate debugging
autocmd FileType javascript map <Leader>cl yiwoconsole.log('<c-r>"', <c-r>");<Esc>^
autocmd FileType php nmap <Leader>cl yiwodie(var_dump('<c-r>"', $<c-r>"));<Esc>^

" This rewires n and N to do the highlighing...
nnoremap <silent> n   n:call HLNext(0.4)<cr>
nnoremap <silent> N   N:call HLNext(0.4)<cr>

highlight WhiteOnRed ctermbg=red

" Blink highlight the match that you are on 
function! HLNext (blinktime)
    let [bufnum, lnum, col, off] = getpos('.')
    let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    let target_pat = '\c\%#'.@/
    let ring = matchadd('WhiteOnRed', target_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    call matchdelete(ring)
    redraw
endfunction

"------------------------------------------------------------
"" Indentation options {{{1

"" Indentation settings according to personal preference.
 
" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab
