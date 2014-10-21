
" +------------------------------------------------------------------------------------------------+
" | Function definitions                                                                           |
" +------------------------------------------------------------------------------------------------+

  " +--------------------------------------------+
  " | General Functions                          |
  " +--------------------------------------------+

  " save file (Ctrl+s)
  fun! FileSave()
    echo "File has been written ..."
    update
  endf

  " close window (Ctrl+q)
  fun! FileClose()
    " do not close NERDTree (and Tagbar in developer mode)
    if (g:NERDTreeOn==1) && (winnr()==1)
      echo "Cannot close window! (is NERDTree ...)"
    elseif (g:TagbarOn==1) && (g:develmode==1) && (winnr()==bufwinnr("__Tagbar__"))
      echo "Cannot close window! (is Tagbar and you are running in developer mode ...)"
    else
      echo "File has been closed ..."
      " check whether a tab or a right window was closed
      call NavDetectClosedWin()
      quit
      " move cursor to main window
      if (g:NERDTreeOn==1) && (winnr()==1)
        exe 2 . "wincmd w"
      endif
    endif
    " TODO: after tab was closed check for last(main)windows
    " if tabpagenr()>1
    " else
      "   echo "Bye bye ... !"
      "   quitall
      " echo "Attention!"
      " quit
    " endif
  endfun

  " save file and close window (Ctrl+x)
  fun! FileSaveClose()
    call FileSave()
    call FileClose()
  endf

  " set development mode
  function! NavSetDevelMode()
    let g:develmode=1                                       " enable development mode
    let g:NERDTreeOn=1                                      " NERDTree is open (=1)
    let g:TagbarOn=1                                        " Tagbar is open (=1)
    let g:winright=3                                        " set window right variable to three
    let g:twomainwins=1                                     " set two main window variable to one
    let g:lastwin=2                                         " set last window variable to two
    let g:lastmainwin=2                                     " set last main window variable to two
    let g:tabcounter=1
    2wincmd w                                               " move cursor to (left) main window
    :TagbarOpen                                             " open Tagbar 
    IndentGuidesEnable                                      " enable indent guides
  endfunction


  " +--------------------------------------------+
  " | Window Navigation                          |
  " +--------------------------------------------+

  " get number of last main window
  function! NavGetLastmainwin()
    return g:lastmainwin
  endfunction

  " get number of last main window
  function! NavGetLastwin()
    return g:lastwin
  endfunction

  " After new buffer has created
  function! NavDetectNewTabWin()
    call NavScanEnv()
  endfunction

  " After a window has been closed
  function! NavDetectClosedWin()
    let l:counter = winnr() - g:NERDTreeOn
    " check for closed tab
    if l:counter==1
      let g:tabcounter=g:tabcounter-1
    endif
    " check for closed 2nd main window
    if l:counter==2
      let g:twomainwins=1
    endif
  endfunction

  function! NavScanEnv()
    " check for NERDTree
    if (exists(":NERDTree"))
      let g:NERDTreeOn=1
    endif
    " check for Tagbar and two main windows
    let g:twomainwins=1
    if bufwinnr("__Tagbar__")<0
      let g:TagbarOn=0
      " TODO: check whether there is one main window or two
      if g:develmode==1
        TagbarOpen
        let g:TagbarOn=1
      end
    else
      let g:TagbarOn=1
      if bufwinnr("__Tagbar__")==4
        let g:twomainwins=2
      endif
    endif
    " calculate right window number
    let g:winright=g:NERDTreeOn+g:twomainwins+g:TagbarOn
    " check last window variables
    " let g:lastmainwin=1
    " let g:lastwin=1
    " call NavShowWinInfo()
  endfunction
  command! NavScanEnv call NavScanEnv()

  " show window information
  fun NavShowWinInfo()
    echo "Devel Mode:       "g:develmode
    echo "NERDTreeOn:       "g:NERDTreeOn
    echo "TagbarOn:         "g:TagbarOn
    echo "winright:         "g:winright
    echo "twomainwins:      "g:twomainwins
    echo "tabcounter:       "g:tabcounter
    echo "Last Window:      "g:lastwin
    echo "Last Main Window: "g:lastmainwin
    echo "Last Tab:         "g:lasttab
  endf 
  command! NavShowWinInfo call NavShowWinInfo()

  " switch to the left window 
  function! NavSwitchWinLeft()
    if(winnr()>1)
      let l:tmp=winnr()
      let l:targetwindow=l:tmp-1
      exe l:targetwindow . "wincmd w"
      let g:lastwin=l:tmp
      if (g:twomainwins==2) && ((l:tmp==2)||(l:tmp==3))
        let g:lastmainwin=l:tmp
      endif
      echo "Switched to left window!"
    else
      echo "Error: No left window found!"
    endif
  endfunction
  
  " switch to the right window 
  function! NavSwitchWinRight()
    if(winnr()<g:winright)
      let l:tmp=winnr()
      let l:targetwindow=l:tmp+1
      exe l:targetwindow . "wincmd w"
      let g:lastwin=l:tmp
      if (g:twomainwins==2) && ((l:tmp==2)||(l:tmp==3))
        let g:lastmainwin=l:tmp
      endif
      echo "Switched to right window!"
    else
      echo "Error: No right window found!"
    endif
  endfunction
  
  " switch to the left tab
  function! NavSwitchTabLeft()
    let g:lasttab=tabpagenr()
    " move cursor to last main window when it is currently located in Tagbar
    if(g:TagbarOn==1) && (winnr()==bufwinnr("__Tagbar__"))
      exe g:lastmainwin . "wincmd w"
      let g:lastwin=bufwinnr("__Tagbar__")
    endif
    " command
    if tabpagenr("$")==1
      echo "Cannot switch to left tab!"
    else
      tabprevious
      echo "Switched to tab"tabpagenr()
      call NavScanEnv()
    endif
  endfunction
  
  " switch to the right tab
  function! NavSwitchTabRight()
    let g:lasttab=tabpagenr()
    " move cursor to last main window when it is currently located in Tagbar
    if(g:TagbarOn==1) && (winnr()==bufwinnr("__Tagbar__"))
      exe g:lastmainwin . "wincmd w"
      let g:lastwin=bufwinnr("__Tagbar__")
    endif
    " command
    if tabpagenr("$")==1
      echo "Cannot switch to right tab!"
    else
      tabnext
      echo "Switched to tab"tabpagenr()
      call NavScanEnv()
    endif
  endfunction

  " open/close Tagbar on/off
  function! NavOpenCloseTagbar()
    if bufwinnr("__Tagbar__")<0
      TagbarOpen
      let g:TagbarOn=1
      echo "Opened Tagbar window!" 
    else
      TagbarClose
      let g:TagbarOn=0
      echo "Closed Tagbar window!" 
    endif
    call NavScanEnv()
  endfunction
  
  " toggle with last tab
  function! NavToggleLastTab()
    let tmp=tabpagenr()
    exec("tabnext " . g:lasttab)
    let g:lasttab=tmp
    call NavScanEnv()
  endfunction

  " toggle between main windows
  function! NavToggleMainwin()
    let l:tmp=winnr()-g:NERDTreeOn
    let l:tmp2=0
    if g:twomainwins==2
      if l:tmp==0 
        echo "Cannot switch from NERDTree to last main window !!!"
      elseif l:tmp>2
        let g:lastwin=winnr()
        exe g:lastmainwin . "wincmd w"
        if winnr()-g:NERDTreeOn==1
          let g:lastmainwin+=1
        elseif winnr()-g:NERDTreeOn==2
          let g:lastmainwin-=1
        else
          echo "03 Error: Problem in NavToggleLastmainwin() !!!"
        endif
      elseif l:tmp==1 || l:tmp==2
        let l:tmp2=g:lastmainwin
        let g:lastwin=winnr()
        let g:lastmainwin=winnr()
        exe l:tmp2 . "wincmd w"
        if l:tmp==2
          echo "Switched to left main window!"
        elseif l:tmp==1
          echo "Switched to right main window!"
        else
          echo "02 Error: Problem in NavToggleLastmainwin() !!!"
        endif
      else 
        echo "01 Error: Problem in NavToggleLastmainwin() !!!"
      endif
    else
      echo "There is no right main window!"
    endif
  endfunction

  " toggle between NERDTree and last main window
  function! NavToggleNERDTree()
    if (exists(":NERDTree")) && (winnr()==1)
      let l:newlastwin=1
      exe NavGetLastwin() . "wincmd w"
      echo "Toggled with NERDTree (bwd)"
      let g:lastwin=l:newlastwin
    elseif (exists(":NERDTree")) && (winnr()>1) && (winnr()<=4)
      let l:newlastwin=winnr()
      exe 1 . "wincmd w"
      echo "Toggled with NERDTree (fwd, from"l:newlastwin")"
      let g:lastwin=l:newlastwin
    elseif (exists(":NERDTree")) && (winnr()>4)
      echo "Somthing went wrong toggling NERDTree !!!"g:lastwin
    else
      echo "No NERDTree window available!"
    endif
  endfunction

  " toggle between Tagbar and last main window
  function! NavToggleTagbar()
    if (g:TagbarOn==1) && (winnr()==bufwinnr("__Tagbar__"))
      let l:newlastwin=bufwinnr("__Tagbar__")
      exe NavGetLastwin() . "wincmd w"
      echo "Toggled with Tagbar (bwd)"
      let g:lastwin=l:newlastwin
    elseif (g:TagbarOn==1) && (winnr()>=1) && (g:winright==bufwinnr("__Tagbar__"))
      let l:newlastwin=winnr()
      exe bufwinnr("__Tagbar__") . "wincmd w"
      echo "Toggled with Tagbar (fwd, from"l:newlastwin")"
      let g:lastwin=l:newlastwin
    elseif (g:TagbarOn==1) && (winnr()>4)
      " echo "Somthing went wrong toggling NERDTree !!!"
    else
      echo "No Tagbar window available!"
    endif
  endfunction
  
  " new tab from NERDTree
  function! NavNewTab(filenode)
    exec("tabnew " . a:filenode.displayString())
    let g:tabcounter=g:tabcounter+1
    call NavScanEnv()
  endfunction

  " new tab from NERDTree (silently)
  function! NavNewTabSilent(filenode)
    exec("tabnew " . a:filenode.displayString())
    exec("tabnext " . g:lasttab)
    exec(1 . "wincmd w")
    let g:tabcounter=g:tabcounter+1
    call NavScanEnv()
  endfunction
  
  " new right window from NERDTree
  function! NavNewSplitWin(filenode)
    if g:twomainwins==1
      exec(2 . "wincmd w")
      exec("rightbelow vsplit " . a:filenode.displayString())
    elseif g:twomainwins==2
      exec("tabnew " . a:filenode.displayString())
    else
      echo "01 Error: Problem in NavNewSplitWinSilent !!!"
    endif
    call NavScanEnv()
  endfunction

  " new right window from NERDTree (silently)
  function! NavNewSplitWinSilent(filenode)
    if g:twomainwins==1
      exec(2 . "wincmd w")
      exec("rightbelow vsplit " . a:filenode.displayString())
      exec(1 . "wincmd w")
    elseif g:twomainwins==2
      exec("tabnew " . a:filenode.displayString())
    else
      echo "01 Error: Problem in NavNewSplitWinSilent !!!"
    endif
    call NavScanEnv()
  endfunction


  " +--------------------------------------------+
  " | Syntastic                                  |
  " +--------------------------------------------+

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

  " show syntax highlight group
  function! SyntaxItem()
    return synIDattr(synID(line("."),col("."),1),"name")
  endfunction
  " corresponding function invoke
  command! SyntaxItem echo(SyntaxItem())

  " If only 2 windows left, NERDTree and Tag_List, close vim or current tab
  " fun! NoExcitingBuffersLeft()
    " echo "That's it!"winnr("$")
    " if winnr("$") == 3
    "   let w1 = bufname(winbufnr(1))
    "   let w2 = bufname(winbufnr(2))
    "   let w3 = bufname(winbufnr(3))
    "   " echo w1" "w2" "w3
    "   if (exists(":NERDTree")) && (w1 == "__Tag_List__" || w2 == "__Tag_List__" || w3 == "__Tag_List__")
    "     " echo "tabpgenrs: "tabpagenr("$")
    "     if tabpagenr("$") == 1
    "       " echo "quitall: "w2
    "       exec 'TlistToggle'
    "     else
    "       " echo "tabclose!"
    "       exec 'TlistToggle'
    "     endif
    "   endif
    " endif
  " endfun
  " autocmd BufWinLeave * call NoExcitingBuffersLeft()
  " command! Quitbufs call NoExcitingBuffersLeft()
  
