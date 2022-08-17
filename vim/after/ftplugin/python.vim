augroup filetype_python
    autocmd!

    " --------------------------------- OPTIONS

    au FileType python setl showmatch
    au FileType python setl expandtab cindent tw=80
    au FileType python setl pa+=$DOTVIM/after/ftplugin/

    " --------------------------------- MAPPINGS

    "   RUN FILE
    au FileType python nn <buffer> <Space>5 :w\|lc %:h<CR>
                \:!clear; /usr/bin/python3 %<CR>

    "   PRINT EXPR VALUE
    au FileType python nn <buffer> <Space>3 :lc %:h<CR>
                \
                \:sil ec "Duplicate the line."<CR>
                \0Yp
                \:sil ec "Wrap the current line expression into a print."<CR>
                \iprint(<Esc>A=<Esc>V:s/=.*//<CR>A)<Esc>:w<CR>
                \:sil ec "Print its value in a comment"<CR>
                \:undojoin \| r!/usr/bin/python3 % 2>/dev/null<CR>`[V`]<C-V>0I#>> <Esc>
                \:sil ec "Delete line"<CR>
                \kdd

    "   RUN ALL
    au FileType python nn <buffer> <Space>8 :w\|lc %:h<CR>
                \:!clear; /usr/bin/python3 main.py<CR>

    "   PRINT
    au Filetype python nn <silent><buffer> <Space>p oprint ()<Esc>==f)i

    "   PRINT WRAP
    au Filetype python nn <silent><buffer> <Space>P 0iprint (<Esc>A)<Esc>==f)h

augroup END
