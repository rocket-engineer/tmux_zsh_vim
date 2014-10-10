
" +------------------------------------------------------------------------------------------------+
" | General                                                                                        |
" +------------------------------------------------------------------------------------------------+

" +----------------------------------------------+
" | Essential Settings                           |
" +----------------------------------------------+

set mouse=a                               " enable mouse
set mousehide                             " hide the mouse cursor while typing
" set paste                               " enable more convenient paste mode
set showcmd                               " show command line
set encoding=utf-8                        " set coding set
"set clipboard=unnamedplus                 "	copy stuff to clipboard
set clipboard=unnamed,unnamedplus
"set backspace=2                          " make backspace work like most other applications
"set autoread                              " auto read external file changes
set history=1000                          " keep 100 lines of history
let mapleader=","                         " define map leader key

" --> status line settings (disable when airline is enabled)
set laststatus=2 													" enable status line
set statusline=%<%f\ 											" Filename
set statusline+=%w%h%m%r 									" Options
"set statusline+=%{fugitive#statusline()} " Git Hotness
set statusline+=\ [%{&ff}/%Y] 						" Filetype
set statusline+=\ [%{getcwd()}] 					" Current dir
set statusline+=%=%-14.(%l,%c%V%)\ %p%% 	" Right aligned file nav info

" --> file directories
set noswapfile                            " No swap file
set backup                                " make backup files
set backupdir=~/.vim/backup/              " put backup files in backup dir
set directory=~/.vim/tmp/                 " put swap files in temp dir
set viewdir=~/.vim/views/                 " put view files in views dir
                                          
" --> window settings                     
set splitbelow                            " add new window to the bottom
set splitright                            " add new window to the right

"-->  ruler settings
"set ruler  																					" enable ruler
"set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) 	" A ruler on steroids
"set showcmd   																			" show command line
   

" +----------------------------------------------+
" | Appearance Settings                          |
" +----------------------------------------------+

syntax on                       " enable syntax
set t_Co=256                    " set number of colors
colorscheme wombat256           " define the colorscheme
set number                      " enable row numbers
set cursorline                  " show cursor line
set wildmenu                    " enable wildmenu
set tabstop=2                   " set number of spaces for tabstop
set shiftwidth=2                " 
set expandtab                   " convert tabs to spaces
set autoindent                  " auto indent after new line
"set cindent                     " enable indent for c code

" --> UI settings
"" set background=dark 						" set dark color scheme
"" set guifont=Inconsolata 				" default gui font

" --> indent rules
"":nmap <tab> ==									" enable emacs-like indenting 


" +----------------------------------------------+
" | Folding Settings                             |
" +----------------------------------------------+

" disable folding for multicolumn commments
":let c_no_comment_fold = 1
		
" --> folding rules
"set foldmethod=syntax
"" set foldlevelstart=0
"set foldnestmax=1
""set foldlevel=5

" Don't screw up folds when inserting text that might affect them, until
" leaving insert mode. Foldmethod is local to the window.
"autocmd InsertEnter * let w:last_fdm=&foldmethod | setlocal foldmethod=manual
"autocmd InsertLeave * let &l:foldmethod=w:last_fdm

" --> FORTRAN specific
"let fortran_fold=1                   		" activate folding in FORTRAN
"" let fortran_fold_conditionals=1    		" fold also do, while etc.
"let fortran_more_precise=1           		" more syntax coloring in FORTRAN
"" let fortran_fold_multilinecomments=1 	" fold also multiline comments

" --> highlight on overlength
"" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"" match OverLength /\%132v.\+/

" save and re-open folding
""au BufWinLeave * mkview
""au BufWinEnter * silent loadview

