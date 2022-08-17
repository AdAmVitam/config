set nocp
let &runtimepath.=',$DOTVIM'

"           VIMRC

source $DOTVIM/plugins.vim
source $DOTVIM/options.vim
source $DOTVIM/functions.vim
source $DOTVIM/mappings.vim

"           FTPLUGIN

source $DOTVIM/after/ftplugin/c.vim
source $DOTVIM/after/ftplugin/vim.vim
source $DOTVIM/after/ftplugin/python.vim
source $DOTVIM/after/ftplugin/notes.vim

"           STARTUP

augroup startup
    autocmd!
    au VimEnter * if @% == '' | setl path+=$NOTES/**,$DOTVIM | endif
    au VimEnter * if @% == '' | nn <buffer><silent> <CR> :e $NOTES/todo.md<CR>GMz. | endif
augroup END
