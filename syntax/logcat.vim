" Vim syntax file
" Language:         logcat
" Maintainer:       Naseer Ahmed <naseer.ahmed@gmail.com>
" Latest Revision:  2009-08-10

if exists("b:current_syntax")
    finish
endif

"Define colors
hi def LogF_color ctermfg=white guifg=white ctermbg=red guibg=red
hi def LogE_color ctermfg=red guifg=red
hi def LogW_color ctermfg=brown guifg=brown
hi def LogI_color ctermfg=blue guifg=blue
hi def LogD_color ctermfg=darkgreen guifg=darkgreen
hi def LogV_color ctermfg=gray guifg=gray

" syn match LogF 'F/.*'
" syn match LogE 'E/.*'
" syn match LogW 'W/.*'
" syn match LogI 'I/.*'
" syn match LogD 'D/.*'
" syn match LogV 'V/.*'
" syn match LogF ' F '
" syn match LogE ' E '
" syn match LogW ' W '
" syn match LogI ' I '
" syn match LogD ' D '
" syn match LogV ' V '

function! s:Syn_match_log(tag)
    let l:log_pattern = "syn match Log%s '".
                \ '\d\d-\d\d \d\d:\d\d:\d\d\.\d\d\d\s\+\d\+\s\+\d\+\zs %s \ze'.
                \ "'"
    let l:cmd = printf(l:log_pattern, a:tag, a:tag)
    " echomsg l:cmd
    execute l:cmd
endfunction

call s:Syn_match_log('F')
call s:Syn_match_log('E')
call s:Syn_match_log('W')
call s:Syn_match_log('I')
call s:Syn_match_log('D')
call s:Syn_match_log('V')

hi def link LogF LogF_color
hi def link LogE LogE_color
hi def link LogW LogW_color
hi def link LogI LogI_color
hi def link LogD LogD_color
hi def link LogV LogV_color
