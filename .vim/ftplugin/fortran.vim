
" +------------------------------------------------------------------------------------------------+
" | Plugin specific settings                                                                       |
" +------------------------------------------------------------------------------------------------+

" +------------------------------------------+
" | NERDTree                                 |
" +------------------------------------------+

" settings
let g:nerdtree_tabs_open_on_console_startup = 1  	  " open NERDTree at startup
autocmd VimEnter * wincmd p 												" move the cursor to the main window
autocmd BufEnter * NERDTreeMirrorOpen 							" let NERDTree auto-open


" +------------------------------------------+
" | Taglist                                  |
" +------------------------------------------+

" settings
autocmd VimEnter * TlistToggle
" autocmd BufNewFile * TlistToggle
" autocmd BufEnter * TlistToggle

" define what to show
let s:tlist_def_fortran_settings = 'fortran;s:subroutine'

