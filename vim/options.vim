" --------------------------------- UI

filetype plugin indent on           "   filetype, plugin, indent auto-detect

augroup custom_hi
	autocmd!
	au ColorScheme * hi Normal ctermbg=NONE "   vim transparent background
	au ColorScheme * sy enable maxlines=200	"   syntax on
	au ColorScheme * hi Comment term=bold ctermfg=104 " Code Comments colors
augroup END

color dracula | set bg=dark

" --------------------------------- ERGONOMIC

set number                          "   display line number
set ignorecase smartcase            "   ignore case except if uppercase used
set listchars=tab:>\ ,trail:-       "   strings to use for :list command
set nowrap                          "   disable screen line wrapping
set ruler                           "   cursor pos%[y:x] in statusline
set showcmd                         "   cursor pos%[y:x] in statusline
set showmatch                       "   set showmatch
set shortmess-=S                    "   displays [x/y] for search pattern occurences
set wildmenu                        "   displays possible completion matches
set spelllang=en,fr                 "   spell lang suggestions
set sessionoptions-=curdir          "   mksession cd to the session file dir
set sessionoptions+=sesdir          "   mksession cd to the session file dir
set laststatus=0                    "   hide the bottom bare with the current path/filename
if empty(glob($DOTVIM . "/spell"))
	exec 'silent !mkdir $DOTVIM/spell'
endif
set spellfile=$DOTVIM/spell/custom.utf-8.add
set pa=0                            "   reset path

" --------------------------------- INDENTATION

set autoindent                      "   auto indent
set expandtab                       "   insert spaces instead tab
set formatoptions+=j                "   see ':h fo-table'
set shiftround                      "   indent to the nearest tab mark
set shiftwidth=4 tabstop=4          "   shift and tab width in spaces
"

" --------------------------------- PERFORMANCES

set lazyredraw                      "   increase macro fluidity
set maxmempattern=100000            "   pattern matching memory in kB (max 2kk)
set ttimeoutlen=0                   "   mapping and keycode delays (fix esc)

" --------------------------------- SECURITY

set belloff=all                     "   no more ring the bell
set history=9999                    "   extends cmdline history
set nomodeline secure               "   disables shell access / modelines
if empty(glob($DOTVIM . "/.backup"))
	exec 'silent !mkdir $DOTVIM/.backup'
endif
set backupdir=$DOTVIM/.backup//,/tmp//      "   backup files directory
if empty(glob($DOTVIM . "/.swp"))
	exec 'silent !mkdir $DOTVIM/.swp'
endif
set directory=$DOTVIM/.swp//,/tmp//         "   undo files directory
if empty(glob($DOTVIM . "/.undo"))
	exec 'silent !mkdir $DOTVIM/.undo'
endif
set undodir=$DOTVIM/.undo//,/tmp//              "   undo files directory
set undofile                                    "   enable undofiles
set viminfo+='100,<50,s10,h,n$DOTVIM/.viminfo   " viminfo location
