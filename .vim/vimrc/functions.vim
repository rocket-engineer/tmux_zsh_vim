
" +------------------------------------------------------------------------------------------------+
" | Function definitions                                                                           |
" +------------------------------------------------------------------------------------------------+

  " +--------------------------------------------+
  " | Vim environment                            |
  " +--------------------------------------------+

  " If only 2 windows left, NERDTree and Tag_List, close vim or current tab
  " fun! NoExcitingBuffersLeft()
  "   " echo "That's it!"winnr("$")
  "   if winnr("$") == 3
  "     let w1 = bufname(winbufnr(1))
  "     let w2 = bufname(winbufnr(2))
  "     let w3 = bufname(winbufnr(3))
  "     " echo w1" "w2" "w3
  "     if (exists(":NERDTree")) && (w1 == "__Tag_List__" || w2 == "__Tag_List__" || w3 == "__Tag_List__")
  "       " echo "tabpgenrs: "tabpagenr("$")
  "       if tabpagenr("$") == 1
  "         " echo "quitall: "w2
  "         exec 'TlistToggle'
  "       else
  "         " echo "tabclose!"
  "         exec 'TlistToggle'
  "       endif
  "     endif
  "   endif
  " endfun
  " autocmd BufWinLeave * call NoExcitingBuffersLeft()
  " command! Quitbufs call NoExcitingBuffersLeft()
  

  " +--------------------------------------------+
  " | Vim environment                            |
  " +--------------------------------------------+

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
  

  " +--------------------------------------------+
  " | Misc                                       |
  " +--------------------------------------------+

  " Color test: Save this file, then enter ':so %'
  " Then enter one of following commands:
  " :VimColorTest
  fun! VimColorTest(outfile, fgend, bgend)
   	let result = []
 	  for fg in range(a:fgend)
      for bg in range(a:bgend)
        let kw = printf('%-7s', printf('c_%d_%d', fg, bg))
        let h = printf('hi %s ctermfg=%d ctermbg=%d', kw, fg, bg)
        let s = printf('syn keyword %s %s', kw, kw)
        call add(result, printf('%-32s | %s', h, s))
      endfor
 	  endfor
 	  call writefile(result, a:outfile)
 	  execute 'edit '.a:outfile
 	  source %
  endfun
  " Increase numbers in next line to see more colors.
  command! VimColorTest call VimColorTest('vim-color-test.tmp', 12, 16)

