
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
    execute "set <xF1>=\e[1;*P"
    execute "set <xF2>=\e[1;*Q"
    execute "set <xF3>=\e[1;*R"
    execute "set <xF4>=\e[1;*S"
    execute "set <F5>=\e[15;*~"
    execute "set <F6>=\e[17;*~"
    execute "set <F7>=\e[18;*~"
    execute "set <F8>=\e[19;*~"
    execute "set <F9>=\e[20;*~"
    execute "set <F10>=\e[21;*~"
    execute "set <F11>=\e[23;*~"
    execute "set <F12>=\e[24;*~"
endif


" +----------------------------------------------+
" | General Mappings                             |
" +----------------------------------------------+

" CTRL-S for saving, also in Insert and Visuell mode
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

" CTRL-X for saving and closing, also in Insert and Visuell mode
noremap <C-X> :x<CR>
vnoremap <C-X> <Esc>:x<CR>
inoremap <C-X> <Esc>:x<CR>

" CTRL-W for closing, also in Insert and Visuell mode (disabled due to incompatibilies with terminal)
noremap <C-Q> :q<CR>
vnoremap <C-Q> <Esc>:q<CR>
inoremap <C-Q> <Esc>:q<CR>

" open help in a vertical split with :Help or :H
command -nargs=* -complete=help Help vertical belowright help <args>
command -nargs=* -complete=help H vertical belowright help <args>


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
nnoremap <silent> <C-K> :tabm +1<CR>
inoremap <silent> <C-K> :tabm +1<CR>


" window navigation
"noremap <A-a> <C-W><C-H>		" move cursor to left window
"noremap <A-d> <C-W><C-L>		" move cursor to right window
"noremap <A-w> <C-W><C-J>		" move cursor to lower window
"noremap <A-s> <C-W><C-K>		" move cursor to upper window
"nnoremap <S-z> <C-W><C-R>	" swap top/bottom or left/right split
"nnoremap <S-x> <C-W><C-T>	" break out current window into a new tabview
"nnoremap <S-c> <C-W><C-o>	" close every window in the current tabview but the current one

" break the habit of reaching for the arrow keys (disable arrow keys)
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Set fold level
"" map <silent> <F2> :set foldmethod=indent<CR>
"" map <silent> <F3> :set foldlevel=2<CR>
"" map <silent> <F4> :set foldlevel=3<CR>
"" map <silent> <F5> :set foldlevel=4<CR>
"" map <silent> <F6> :set foldlevel=5<CR>
"" map <silent> <F7> :set foldlevel=6<CR>
"" map <silent> <F8> :set foldlevel=7<CR>

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

