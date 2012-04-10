" .vimrc
" See: http://vimdoc.sourceforge.net/htmldoc/options.html for details

" For multi-byte character support (CJK support, for example):
"set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,gb18030,latin1
       
set tabstop=4       " Number of spaces that a <Tab> in the file counts for.
 
set shiftwidth=4    " Number of spaces to use for each step of (auto)indent.
 
set expandtab       " Use the appropriate number of spaces to insert a <Tab>.
                    " Spaces are used in indents with the '>' and '<' commands
                    " and when 'autoindent' is on. To insert a real tab when
                    " 'expandtab' is on, use CTRL-V <Tab>.
 
set smarttab        " When on, a <Tab> in front of a line inserts blanks
                    " according to 'shiftwidth'. 'tabstop' is used in other
                    " places. A <BS> will delete a 'shiftwidth' worth of space
                    " at the start of the line.
 
set showcmd         " Show (partial) command in status line.

set number          " Show line numbers.

set showmatch       " When a bracket is inserted, briefly jump to the matching
                    " one. The jump is only done if the match can be seen on the
                    " screen. The time to show the match can be set with
                    " 'matchtime'.
 
"set hlsearch        " When there is a previous search pattern, highlight all
                    " its matches.
 
set incsearch       " While typing a search command, show immediately where the
                    " so far typed pattern matches.
 
set ignorecase      " Ignore case in search patterns.
 
set smartcase       " Override the 'ignorecase' option if the search pattern
                    " contains upper case characters.
 
set backspace=2     " Influences the working of <BS>, <Del>, CTRL-W
                    " and CTRL-U in Insert mode. This is a list of items,
                    " separated by commas. Each item allows a way to backspace
                    " over something.
 
set autoindent      " Copy indent from current line when starting a new line
                    " (typing <CR> in Insert mode or when using the "o" or "O"
                    " command).
 
set textwidth=79    " Maximum width of text that is being inserted. A longer
                    " line will be broken after white space to get this width.
 
set formatoptions=c,q,r,t " This is a sequence of letters which describes how
                    " automatic formatting is to be done.
                    "
                    " letter    meaning when present in 'formatoptions'
                    " ------    ---------------------------------------
                    " c         Auto-wrap comments using textwidth, inserting
                    "           the current comment leader automatically.
                    " q         Allow formatting of comments with "gq".
                    " r         Automatically insert the current comment leader
                    "           after hitting <Enter> in Insert mode. 
                    " t         Auto-wrap text using textwidth (does not apply
                    "           to comments)
 
set ruler           " Show the line and column number of the cursor position,
                    " separated by a comma.
 
"set background=dark " When set to dark, Vim will try to use colors that look
                    " good on a dark background. When set to "light", Vim wil
                    " try to use colors that look good on a light background.
                    " Any other value is illegal.
 
set mouse=a         " Enable the use of the mouse.
 
filetype plugin indent on
set ofu=syntaxcomplete#Complete             " Enable autocomplete
syntax on                                   " Enable syntax highlighting
let mapleader = ","                         " Set leader key to ','
colors inkpot                               " Set colorsheme
set gfn=Anka/Coder\ 10                      " Set gvim font
set cot-=preview




" Set tab to indent things, shift+tab to unindent them
map <Tab> >gV
map <S-Tab> <gV




" Set C+F12 to generate a new ctags file in current dir
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" Tell OmniComplete to show function prototypes in the autocomplete window
let OmniCpp_ShowPrototypeInAbbr = 1
" Maps NERDTree to F10, and then to F10 in Insert mode
noremap <silent> <F10> :NERDTreeToggle<CR>
noremap! <silent> <F10> <ESC>:NERDTreeToggle<CR>
" Tells NERDTree to use ASCII chars
let g:NERDTreeDirArrows=0




" Better TAB completion for files (like the shell)
"
if has("wildmenu")
    set wildmenu
    set wildmode=longest,list
" Ignore stuff (for TAB autocompletion)
    set wildignore+=*.a,*.o
    set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
    set wildignore+=.DS_Store,.git,.hg,.svn
    set wildignore+=*~,*.swp,*.tmp
endif




" Smart in-line manpages with 'K' in command mode
" <github.com/ttsiodras>
fun! ReadMan()
" Assign current word under cursor to a script variable:
  let s:man_word = expand('<cword>')
" Open a new window:
  :wincmd n
" Read in the manpage for man_word (col -b is for formatting):
  :exe ":r!man " . s:man_word . " | col -b"
" Goto first line...
  :goto
" and delete it:
  :delete
" finally set file type to 'man':
  :set filetype=man
" lines set to 20
  :resize 20
endfun
" Map the K key to the ReadMan function:
noremap K :call ReadMan()<CR>




" Don't beep
set visualbell
set noerrorbells

" Change terminal title
set title
