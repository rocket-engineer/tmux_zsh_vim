
" +------------------------------------------------------------------------------------------------+
" | Plugin specific settings                                                                       |
" +------------------------------------------------------------------------------------------------+

if 1 == VimRCBundlesOptions

	if 1 == VimRCBundlesStandard

    " +------------------------------------------+
    " | NERDTree                                 |
    " +------------------------------------------+
    
   	" settings
    let g:NERDTreeWinSize = 40 													" set the width of the tree
    let g:NERDTreeChDirMode = 2 												" set current dir
    let NERDTreeShowBookmarks = 1 											" always show bookmarks
    let NERDTreeIgnore = ['.o$[[file]]'] 								" ignore object files
    " let g:nerdtree_tabs_open_on_console_startup=1    	" open NERDTree
    " autocmd VimEnter * wincmd p 												" move the cursor to the main window
    "autocmd BufEnter * NERDTreeMirrorOpen 							" let NERDTree auto-open
    
    " keymaps
    nnoremap <silent> <F10> :NERDTreeTabsToggle<CR>			" open NERDTree
    " nnoremap <silent> <S-q> :NERDTreeSteppedOpen<CR>			"	focus NERDTree
    " nnoremap <silent> <S-e> :NERDTreeSteppedClose<CR>			" unfocus NERDTree


    " +------------------------------------------+
    " | Airline                                  |
    " +------------------------------------------+
   
    " settings
    let g:airline#extensions#tabline#enabled = 1				" enable enhanced tabline
    let g:airline#extensions#tabline#show_buffers = 0		"	enable buffers with a single tab
    let g:airline#extensions#tabline#tab_min_count = 0	"	set tab_min_count to zero
    let g:airline#extensions#tabline#tab_nr_type = 1		"	type how to calculate number
    let g:airline_powerline_fonts = 1                   " enable powerline fonts
    "let g:airline#extensions#syntastic#enabled = 1      " enable syntastic integration
    " set guif"+Pont=PowerlineSymbols


    " +------------------------------------------+
    " | Indent Guides                            |
    " +------------------------------------------+
   
    " settings
    let g:indent_guides_enable_on_vim_startup = 1 			" enable Indent Guides at vim startup
    let g:indent_guides_start_level = 2 								" start indent guides at 2nd level
    let g:indent_guides_guide_size = 1 								  " use small indent guides
    let g:indent_guides_space_guides = 1 								" don't care about spaces
    let g:indent_guides_auto_colors = 0                 " indent guides color definition
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=236
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=237
    let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'taglist', 'conf']

	endif

endif


if 1 == VimRCBundlesOptions

	if 1 == VimRCBundlesDevel

    " +------------------------------------------+
    " | Taglist                                  |
    " +------------------------------------------+
    
    " settings
    let Tlist_Use_Right_Window = 1                      " show the list on the right side of the window
	  let Tlist_WinWidth = 40                             " set the width of the list
    let Tlist_Show_One_File = 1                         " only show tags for current file
    let g:Tlist_Exit_OnlyWindow = 1                     " exit if Taglist is only window
    
    " keymaps
    nnoremap <silent> <C-F5> :TlistUpdate<CR>
    "inoremap <silent> <C-F5> :TlistUpdate<CR>
    nnoremap <silent> <F11> :TlistToggle<CR>
    "inoremap <silent> <F11> :TlistToggle<CR>

" If only 2 windows left, NERDTree and Tag_List, close vim or current tab
fun! NoExcitingBuffersLeft()
        exec 'qa'
        echo "This was it!"
  " if winnr("$") == 3
  "   let w1 = bufname(winbufnr(1))
  "   let w2 = bufname(winbufnr(2))
  "   let w3 = bufname(winbufnr(3))
  "   if (exists(":NERDTree")) && (w1 == "__Tag_List__" || w2 == "__Tag_List__" || w3 == "__Tag_List__")
  "     if tabpagenr("$") == 1
  "       echo "huhu: "w2
  "       exec 'qa'
  "     else
  "       exec 'tabclose'
  "     endif
  "   endif
  " endif
endfun
autocmd BufWinLeave * call NoExcitingBuffersLeft()
  
  
    " +------------------------------------------+
    " | delimitMate                              |
    " +------------------------------------------+
    
    "let delimitMate_quotes = "\" '""'"
    let delimitMate_expand_space = 1                " enable expansion of spaces and new lineso
    let delimitMate_expand_cr = 1                   " enable expansion of spaces and new lineso


    " +------------------------------------------+
    " | TComment                                 |
    " +------------------------------------------+
    
    " keymaps
    nmap <leader>c :TComment<CR>
    nmap <leader>= :TCommentBlock<CR>
    vmap <leader>c :TComment<CR>
    vmap <leader>= :TCommentBlock<CR>
    
    " define additional comment styles
    "call tcomment#DefineType('chemkin','! %s')


    " +------------------------------------------+
    " | UltiSnips                                |
    " +------------------------------------------+
    
    let g:UltiSnipsExpandTrigger = "<tab>"                " set UltiSnips trigger
    let g:UltiSnipsJumpForwardTrigger = "<c-n>"		        " set UltiSnips forward trigger
    let g:UltiSnipsJumpBackwardTrigger = "<c-m>"          " set UltiSnips backward trigger
    let g:UltiSnipsListSnippets = "<c-tab>"					      " set UltiSnips list command
    let g:UltiSnipsEditSplit = "vertical"                 " open UltiSnips Edit Window vertically
    let g:UltiSnipsSnippetsDir = "~/.vim/misc/UltiSnips"  " defines UltiSnips snippets directory


    " +------------------------------------------+
    " | YouCompleteMe                            |
    " +------------------------------------------+
    
    " settings
    "let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py' 	" locate global YCM conf file
    "let g:ycm_confirm_extra_conf = 0 													" don't ask for local conf confirmation
    "set pumheight=30 																					" limit popup menu height
    "" let g:ycm_complete_in_comments = 0                      " enable YCM in comments
    "let g:ycm_autoclose_preview_window_after_completion = 1 	" close preview window after completion
    "let g:ycm_autoclose_preview_window_after_insertion = 1 		" close preview window after insertion
		"set ttimeoutlen=50 																				" for faster InsertLeave triggerin
    "set conceallevel=2
    "set concealcursor=vin
    "let g:ycm_concealing_delimiters = ['⟪', '⟫'] 							" set concealing delimiters
    "let g:ycm_extra_spacing = 1 															" one extra space between arguments
    "let g:ycm_register_as_syntastic_checker = 0               " disable syntax checking in YCM
    "let g:ycm_collect_identifiers_from_tags_files = 1         " enable collect data from tags files
    
    " make YCM compatible with UltiSnips (using supertab)
    "let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
    "let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
    "let g:SuperTabDefaultCompletionType = '<C-n>'
		
    " YCM filetype blacklist
    "" let g:ycm_filetype_blacklist = {
    ""       \ 'fortran' : 1
    ""       \}


    " +------------------------------------------+
    " | Supertab                                 |
    " +------------------------------------------+
    
    " settings


    " +------------------------------------------+
    " | Syntastic                                |
    " +------------------------------------------+
    
    " generel settings
		"" let syntastic_debug = 1                             " enable debug mode (trace checker calls)
    "" let g:syntastic_check_on_open = 1                   " enable syntax checking when opening files
    "let g:syntastic_auto_loc_list = 1                   " error window opens and closes automatically
    "let g:syntastic_loc_list_height = 8                 " error window height
    "let g:syntastic_always_populate_loc_list = 1        " always populate errors to location list
    "" let g:syntastic_disabled_filetypes=['']             " disable Syntastic for specific filetypes
    
    " c language settings
    "let g:syntastic_c_compiler = 'gcc'                        " define c checker
    "" let g:syntastic_c_errorformat = '%f:%l:%c: %trror: %m'  " define c error format 
    "" let g:syntastic_c_remove_include_errors = 1             " disable include errors
    "let g:syntastic_c_check_header = 0                      " enable header checking
		"" let g:syntastic_c_no_default_include_dirs = 1
    "" let g:syntastic_c_config_file = '.syntastic_config'       " enable project specific config file
    
    " include standard header files
    "let g:syntastic_c_include_dirs = [ '/media/G/Numerik/LDS_Software/opt/openmpi/include' ]
    
    " c++ language settings
    "" let ...
    "" let ...
    
    " FORTRAN language settings
    "let g:syntastic_fortran_compiler = 'gfortran'               " define FORTRAN checker
		"" let g:syntastic_fortran_errorformat = '%f:%l: %trror: %m' " define FORTRAN error format
    "" let g:syntastic_fortran_remove_include_errors = 1         " disable include errors
    "" let g:syntastic_fortran_config_file = '.syntastic_gfortran_config'   " define config name
    "" let g:syntastic_fortran_include_dirs = [ 'include' ]

    " include the gutter (and line number panel) into error line highlighting
    function! s:getbg(group)
    	if has("gui_running")
    		let l:mode = 'gui'
    		let l:validation = '\w\+\|#\x\+'
    	else
    		let l:mode = 'cterm'
    		let l:validation = '\w\+'
			endif
    
    	if synIDattr(synIDtrans(hlID(a:group)), 'reverse', l:mode)
    		let l:bg = synIDattr(synIDtrans(hlID(a:group)), 'fg', l:mode)
    	else
    		let l:bg = synIDattr(synIDtrans(hlID(a:group)), 'bg', l:mode)
    	endif
    
    	if l:bg == '-1' || l:bg !~ l:validation
    		if synIDattr(synIDtrans(hlID('SignColumn')), 'reverse', l:mode)
    			let l:bg = synIDattr(synIDtrans(hlID('SignColumn')), 'fg', l:mode)
    		else
					let l:bg = synIDattr(synIDtrans(hlID('SignColumn')), 'bg', l:mode)
    		endif
    	endif
        
    	if l:bg == '-1' || l:bg !~ l:validation
    		return ''
    	endif
    
    	return l:mode . 'bg=' . l:bg
    endfunction
    
		" errors and warnings appearence
    "let g:syntastic_error_symbol = '✘✘'
    "let g:syntastic_warning_symbol = '☢☢'
    "hi! link SyntasticErrorLine Visual
    "hi! link SyntasticWarningLine Visual
    "exec 'hi! SyntasticErrorSign guifg=red ctermfg=red ' . s:getbg('SyntasticErrorLine')
    "exec 'hi! SyntasticWarningSign guifg=yellow ctermfg=yellow ' . s:getbg('SyntasticWarningLine')
    "exec 'hi! SyntasticError ' . s:getbg('SyntasticErrorLine')
    "exec 'hi! SyntasticWarning ' . s:getbg('SyntasticWarningLine')
    "highlight SyntasticError ctermfg=red
    "highlight SyntasticWarning ctermfg=yellow
    

	endif

endif

