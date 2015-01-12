if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

" Ensure Vim is not recursively invoked (man-db does this)
" when doing ctrl-] on a man page reference.
if exists('$MANPAGER')
  let $MANPAGER = ''
endif

" allow dot and dash in manual page name.
setlocal iskeyword+=\.,-

setlocal nonumber
setlocal norelativenumber
setlocal foldcolumn=0
setlocal nofoldenable

" tabs in man pages are 8 spaces
setlocal tabstop=8

" scratch buffer options
setlocal buftype=nofile
setlocal bufhidden=hide
setlocal nobuflisted
setlocal noswapfile

" Add mappings, unless the user didn't want this.
if !exists('no_plugin_maps') && !exists('no_man_maps')
  if !hasmapto('<Plug>ManBS')
    nmap <buffer> <LocalLeader>h <Plug>ManBS
  endif
  nnoremap <buffer> <Plug>ManBS :%s/.\b//g<CR>:setlocal nomod<CR>''

  " All tag mappings are defined for completeness. They all perform the same
  " action.
  nnoremap <buffer> <C-]>       :call man#get_page_from_cword(v:count)<CR>
  nnoremap <buffer> g<C-]>      :call man#get_page_from_cword(v:count)<CR>
  nnoremap <buffer> g]          :call man#get_page_from_cword(v:count)<CR>
  nnoremap <buffer> <C-W>]      :call man#get_page_from_cword(v:count)<CR>
  nnoremap <buffer> <C-W><C-]>  :call man#get_page_from_cword(v:count)<CR>
  nnoremap <buffer> <C-W>g<C-]> :call man#get_page_from_cword(v:count)<CR>
  nnoremap <buffer> <C-W>g]     :call man#get_page_from_cword(v:count)<CR>
  nnoremap <buffer> <C-W>}      :call man#get_page_from_cword(v:count)<CR>
  nnoremap <buffer> <C-W>g}     :call man#get_page_from_cword(v:count)<CR>

  nnoremap <buffer> <C-T> :call man#pop_page()<CR>

  nnoremap <silent> <buffer> [[ :<C-U>call man#section_movement('b', 'n', v:count1)<CR>
  nnoremap <silent> <buffer> ]] :<C-U>call man#section_movement('' , 'n', v:count1)<CR>
  xnoremap <silent> <buffer> [[ :<C-U>call man#section_movement('b', 'v', v:count1)<CR>
  xnoremap <silent> <buffer> ]] :<C-U>call man#section_movement('' , 'v', v:count1)<CR>
endif

let b:undo_ftplugin = 'setlocal iskeyword<'

" vim:set ft=vim et sw=2:
