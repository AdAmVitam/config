" --------------------------------- PLUGINS OPTIONS

"   COLORSCHEME
let g:dracula_italic = 0
let g:seoul256_background = 256

" --------------------------------- PLUGINS LOADER

call plug#begin('$DOTVIM/.plugged')
"   GENERAL
Plug 'tpope/vim-repeat'                 "   REPEAT EXTENSION
Plug 'tpope/vim-surround'               "   SURROUND OPERATOR
Plug 'tpope/vim-commentary'             "   COMMENT OUT
"   SWEET
Plug 'junegunn/seoul256.vim'            "   COLORSCHEME
Plug 'dracula/vim'                      "   COLORSCHEME
call plug#end()
"
