"   TRAILING SPACES
function! StripTrailingSpaces()
    if !&binary && &filetype != 'diff'
        let l:view = winsaveview()
        keeppatterns %s/\s\+$//e
        call winrestview(l:view)
    endif
endfunction
augroup trailing_spaces
    au!
    au BufWritePre,FileWritePre * :call StripTrailingSpaces()
augroup END

"   TOGGLE COLORS
function! ColorSwitch(clight, cdark)
    if &background ==# "dark"
        exec 'silent !sed -i --follow-symlinks "s/^color.*/color ' . a:clight . ' | set bg=light/g" ~/.config/vim/options.vim'
        exec 'silent set bg=light'
        exec 'colors ' . a:clight
        exec 'hi Normal ctermbg=NONE'
        exec 'silent !cp ~/.config/alacritty/colors/' . a:clight .'.yml ~/.config/alacritty/colors.yml'
    elseif &background ==# "light"
        exec 'silent !sed -i --follow-symlinks "s/^color.*/color ' . a:cdark . ' | set bg=dark/g" ~/.config/vim/options.vim'
        exec 'silent set bg=dark'
        exec 'colors ' . a:cdark
        exec 'hi Normal ctermbg=NONE'
        exec 'silent !cp ~/.config/alacritty/colors/'. a:cdark .'.yml ~/.config/alacritty/colors.yml'
    endif
endfunction
