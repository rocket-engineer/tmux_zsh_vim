  
" +------------------------------------------------------------------------------------------------+
" | Key Mappings                                                                                   |
" +------------------------------------------------------------------------------------------------+


" +----------------------------------------------+
" | Send keys to TMux                            |
" +----------------------------------------------+

" make vim aware of screen sequences
if &term =~ '^screen' && exists('$TMUX')

    " tmux will send xterm-style keys when xterm-keys is on
    set ttymouse=xterm2

    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
    execute "set <xHome>=\e[1;*H"
    execute "set <xEnd>=\e[1;*F"
    execute "set <Insert>=\e[2;*~"
    execute "set <Delete>=\e[3;*~"
    execute "set <PageUp>=\e[5;*~"
    execute "set <PageDown>=\e[6;*~"
"     execute "set <xF1>=\e[1;*P"
"     execute "set <xF2>=\e[1;*Q"
"     execute "set <xF3>=\e[1;*R"
"     execute "set <xF4>=\e[1;*S"
"     execute "set <F5>=\e[15;*~"
"     execute "set <F6>=\e[17;*~"
"     execute "set <F7>=\e[18;*~"
"     execute "set <F8>=\e[19;*~"
"     execute "set <F9>=\e[20;*~"
"     execute "set <F10>=\e[21;*~"
"     execute "set <F11>=\e[23;*~"
"     execute "set <F12>=\e[24;*~"
endif


" +----------------------------------------------+
" | General Mappings                             |
" +----------------------------------------------+

" CTRL-S for saving, also in Insert and Visuell mode
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR><ESC>
inoremap <C-S> <C-O>:update<CR><ESC>

" CTRL-X for saving and closing, also in Insert and Visuell mode
noremap <C-X> :x<CR>
vnoremap <C-X> <Esc>:x<CR>
inoremap <C-X> <Esc>:x<CR>

" CTRL-W for closing, also in Insert and Visuell mode (disabled due to incompatibilies with terminal)
noremap <C-Q> :q<CR>
vnoremap <C-Q> <Esc>:q<CR>
inoremap <C-Q> <Esc>:q<CR>

" open help in a vertical split with :Help or :H
command! -nargs=* -complete=help Help vertical belowright help <args>
command! -nargs=* -complete=help H vertical belowright help <args>

" break the habit of reaching for the arrow keys (disable arrow keys)
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" set pastetoggle keymap
set pastetoggle=<F8>


" +----------------------------------------------+
" | Tab Mappings                                 |
" +----------------------------------------------+

" open new tab
nnoremap <silent> <C-C> :tabnew<CR>
inoremap <silent> <C-C> <Esc>:tabnew<CR>

" switch to next tab
nnoremap <silent> <C-L> :tabnext<CR>
inoremap <silent> <C-L> <Esc>:tabnext<CR>

" switch to previous tab
nnoremap <silent> <C-H> :tabprevious<CR>
inoremap <silent> <C-H> <Esc>:tabprevious<CR>

" toggle with last tab


" switch to different tab
map <silent> <C-1> 1gt
map <silent> <C-2> :tabn2<CR>
map <silent> <C-3> :tabn3<CR>
map <silent> <C-4> :tabn4<CR>
map <silent> <C-5> :tabn5<CR>
map <silent> <C-6> :tabn6<CR>
map <silent> <C-7> :tabn7<CR>
map <silent> <C-8> :tabn8<CR>
map <silent> <C-9> :tabn9<CR>
map <silent> <C-0> :tabn10<CR>

 " move tab to the left
nnoremap <silent> <C-Left> :tabm -1<CR>
inoremap <silent> <C-Left> :tabm -1<CR>

" move tab to the right
nnoremap <silent> <C-Right> :tabm +1<CR>
inoremap <silent> <C-Right> :tabm +1<CR>


" +----------------------------------------------+
" | Tab Mappings                                 |
" +----------------------------------------------+

" window navigation
nnoremap <M-a> <C-W><C-H>		      " move cursor to left window
inoremap <M-a> <Esc><C-W><C-H>		" move cursor to left window
nnoremap <M-d> <C-W><C-L>		      " move cursor to right window
inoremap <M-d> <Esc><C-W><C-L>		" move cursor to right window
nnoremap <M-s> <C-W><C-J>		      " move cursor to lower window
inoremap <M-s> <Esc><C-W><C-J>  	" move cursor to lower window
nnoremap <M-w> <C-W><C-K>		      " move cursor to upper window
inoremap <M-w> <Esc><C-W><C-K>		" move cursor to upper window
nnoremap <M-x> <C-W><C-P>         " move cursor to previous windows
inoremap <M-x> <Esc><C-W><C-P>    " move cursor to previous windows

" window rotation
" nnoremap <M-S-h> <C-W>R	          " rotate window leftwards
" inoremap <M-S-h> <Esc><C-W>R	    " rotate window leftwards
" nnoremap <M-S-l> <C-W>r	          " rotate window rightwards
" inoremap <M-S-l> <Esc><C-W>r	    " rotate window rightwards
nnoremap <M-S-j> <C-W>x	          " swap current window with next one
inoremap <M-S-j> <Esc><C-W>x	    " swap current window with next one
nnoremap <M-S-c> <C-W>T	          " break out current window into a new tabview
inoremap <M-S-c> <Esc><C-W>T	    " break out current window into a new tabview
" nnoremap <S-c> <C-W><C-o>	" close every window in the current tabview but the current one


" +----------------------------------------------+
" | Folding Mappings                             |
" +----------------------------------------------+

" Set fold level
"" map <silent> <F2> :set foldmethod=indent<CR>
"" map <silent> <F3> :set foldlevel=2<CR>
"" map <silent> <F4> :set foldlevel=3<CR>
"" map <silent> <F5> :set foldlevel=4<CR>
"" map <silent> <F6> :set foldlevel=5<CR>
"" map <silent> <F7> :set foldlevel=6<CR>
"" map <silent> <F8> :set foldlevel=7<CR>


" +----------------------------------------------+
" | Pasting Mappings                             |
" +----------------------------------------------+

"" Paste block while inserting new lines to hold it
"" nnoremap <Leader>p :call FancyPaste('*')<CR>
"" nnoremap <Leader>P :call FancyPaste('+')<CR>

"" a more advanced paste function in order to prevent 
"" function! FancyPaste(reg)
""     let paste = split(getreg(a:reg), '\n')
""     let spaces = repeat(' ', virtcol('.')-1)
""     call map(paste, 'spaces . v:val')
""     call append(line('.'), paste)
"" endfunction

