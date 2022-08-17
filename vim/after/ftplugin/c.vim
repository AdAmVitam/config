augroup filetype_c
    autocmd!

    " --------------------------------- OPTIONS

    au FileType qf setl wrap
    au FileType c,cpp setl showmatch
    au FileType c,cpp setl noexpandtab cindent textwidth=80
    au FileType c,cpp,make setl path+=$PWD/include/,$PWD/*src/**

    au FileType c,cpp let b:cc = "clang"
    au FileType c,cpp let b:cflags = "-Wall -Wextra -Werror -Wconversion -Wsign-conversion"
    au FileType c,cpp let b:san = "-fsanitize=address,undefined,signed-integer-overflow -g"
    au FileType c,cpp let b:librairies = ""

    " --------------------------------- MAPPINGS

    "   COMPILE [& RUN] ONE

    "   Safe
    au Filetype c nn <silent><buffer> <Space>5 :w\|lc %:h<CR>
                \
                \:exec '!clear;'<CR>
                \:exec 'silent !rm -rf a.out a.out.dSYM'<CR>
                \:exec 'silent !' . b:cc ' ' . b:cflags . ' ' . b:san . ' % ' . b:librairies . ' 2>/tmp/c_qf_err'<CR>
                \:cfile /tmp/c_qf_err<CR>:5cw<CR>
                \:exec '!clear;./a.out'<CR>

    "   Unsafe
    au Filetype c nn <silent><buffer> <Space>% :w\|lc %:h<CR>
                \
                \:exec 'silent !rm -rf a.out a.out.dSYM'<CR>
                \:exec 'silent !' . b:cc . ' -Wno-everything % ' . b:librairies . ' 2>/tmp/c_qf_err'<CR>
                \:cfile /tmp/c_qf_err<CR>:5cw<CR>
                \:exec '!clear;./a.out'<CR>

    "   COMPILE [& RUN] ALL

    "   Safe
    au Filetype c nn <silent><buffer> <Space>8 :wa\|lc %:h<CR>
                \
                \:exec 'silent !rm -rf a.out a.out.dSYM'<CR>
                \:exec 'silent !' . b:cc ' ' . b:cflags . ' ' . b:san . ' *.c ' . b:librairies . ' 2>/tmp/c_qf_err'<CR>
                \:cfile /tmp/c_qf_err<CR>:5cw<CR>:
                \:exec '!clear;./a.out \|cat -e'<CR>

    "   Unsafe
    au Filetype c nn <silent><buffer> <Space>* :wa\|lc %:h<CR>
                \
                \:exec 'silent !rm -rf a.out a.out.dSYM'<CR>
                \:exec 'silent !' . b:cc . ' -Wno-everything *.c ' . b:librairies . ' 2>/tmp/c_qf_err'<CR>
                \:cfile /tmp/c_qf_err<CR>:5cw<CR>
                \:exec '!clear;./a.out \|cat -e'<CR>

    "   PRINT
    au Filetype c nn <silent><buffer> <Space>p mpodprintf (2, "\n");<Esc>==f\i

    "   MARKER
    au Filetype c nn <silent><buffer> <Space>m <nop>
    au Filetype c nn <silent><buffer> <Space>mm mmodprintf (2, "(%s: %s: %d)\n",
                \__FILE__, __func__, __LINE__);<Esc>==f%

augroup END
