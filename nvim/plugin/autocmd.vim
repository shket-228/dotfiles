" Functions
fun! RelativeNumberOn()
    if &number == 1
        set relativenumber
        "redraw
    endif
endfun


" Autocommands
augroup no_autocomment
    autocmd!
    autocmd FileType * setlocal formatoptions-=cro 
augroup END

augroup line_numeration
    autocmd!
    autocmd FocusLost,WinLeave,CmdlineEnter * set norelativenumber | redraw
    autocmd FocusGained,WinEnter,CmdlineLeave,BufEnter * call RelativeNumberOn()
augroup END

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 100})
augroup END

" augroup trim_spaces
"     autocmd!
"     autocmd BufWritePre * %s/\s\+$//e
" augroup END

"augroup etc
"    autocmd!
"    autocmd FileType help wincmd L
"augroup END
