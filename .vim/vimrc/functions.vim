"---------------------------------------------
" Startup commands
"---------------------------------------------
" " If only 2 windows left, NERDTree and Tag_List, close vim or current tab
" autocmd BufWinLeave * call NoExcitingBuffersLeft()
" 
" function! NoExcitingBuffersLeft()
" 	exec 'qa'
" " 	if winnr("$") == 3
" "   	let w1 = bufname(winbufnr(1))
" " 	  let w2 = bufname(winbufnr(2))
" "   	let w3 = bufname(winbufnr(3))
" " 	  if (exists(":NERDTree")) && (w1 == "__Tag_List__" || w2 == "__Tag_List__" || w3 == "__Tag_List__")
" "   	  if tabpagenr("$") == 1
" "     	  exec 'qa'
" " 			else
" "   	    exec 'q'
" "     	endif
" "   	endif
" " 	endif
" endfun


"---------------------------------------------
" User defined functions
"---------------------------------------------

" close vim if closing last tab
"function! NERDTreeQuit()
"  redir => buffersoutput
"  silent buffers
"  redir END
"                     1BufNo  2Mods.     3File           4LineNo
"  let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
"  let windowfound = 0

"  for bline in split(buffersoutput, "\n")
"    let m = matchlist(bline, pattern)

"    if (len(m) > 0)
"      if (m[2] =~ '..a..')
"        let windowfound = 1
"      endif
"    endif
"  endfor

"  if (!windowfound)
"    quitall
"  endif
"endfunction
"autocmd WinEnter * call NERDTreeQuit()


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

