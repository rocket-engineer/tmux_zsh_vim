
" +------------------------------------------------------------------------------------------------+
" | Function definitions                                                                           |
" +------------------------------------------------------------------------------------------------+

" +----------------------------------------------+
" | Vim environment                              |
" +----------------------------------------------+

" If only 2 windows left, NERDTree and Tag_List, close vim or current tab
" fun! NoExcitingBuffersLeft()
"   echo "This is a test!" winnr("$")
"   if winnr("$") == 3
"     let w1 = bufname(winbufnr(1))
"     let w2 = bufname(winbufnr(2))
"     let w3 = bufname(winbufnr(3))
"     if (exists(":NERDTree")) && (w1 == "__Tag_List__" || w2 == "__Tag_List__" || w3 == "__Tag_List__")
"       if tabpagenr("$") == 1
"         echo "huhu: "w2
"         exec 'qa'
"       else
"         exec 'tabclose'
"       endif
"     endif
"   endif
" endfun
" autocmd BufWinLeave * call NoExcitingBuffersLeft()


" +----------------------------------------------+
" | Misc                                         |
" +----------------------------------------------+

" Color test: Save this file, then enter ':so %'
" Then enter one of following commands:
"   :VimColorTest    "(for console/terminal Vim)
" function! VimColorTest(outfile, fgend, bgend)
" 	let result = []
" 	for fg in range(a:fgend)
" 		for bg in range(a:bgend)
" 			let kw = printf('%-7s', printf('c_%d_%d', fg, bg))
" 			let h = printf('hi %s ctermfg=%d ctermbg=%d', kw, fg, bg)
" 			let s = printf('syn keyword %s %s', kw, kw)
" 			call add(result, printf('%-32s | %s', h, s))
" 		endfor
" 	endfor
" 	call writefile(result, a:outfile)
" 	execute 'edit '.a:outfile
" 	source %
" endfunction
" " Increase numbers in next line to see more colors.
" command! VimColorTest call VimColorTest('vim-color-test.tmp', 12, 16)

