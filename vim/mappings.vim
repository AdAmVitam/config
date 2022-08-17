" --------------------------------- NAV (s)

"                       FILE

"   FIND
nn sf :find<Space>

"   EDIT
nn se :e *

"                       BUFFER

"   PREV
nn ss :b#<CR>

"   BUFLIST
nn sb :ls<CR>:b<Space>

"   MISC
nn sd :bn\|bd#<CR>

"                       NOTES

nn sl :e $NOTES/todo.md<CR>gi<Esc>z.
nn xI :e $NOTES/INDEX.md<CR>

"                       CONF

nn xxv :e ~/.vimrc<CR>gi<Esc>
nn xxz :e ~/.zshrc<CR>gi<Esc>
nn xxa :e ~/.config/alacritty/alacritty.yml<CR>gi<Esc>
nn xxi :e ~/.config/i3/config<CR>gi<Esc>
nn xxt :e ~/.tmux.conf<CR>gi<Esc>
nn xxn :!sudo vi /etc/netplan/00-installer-config.yaml<CR>

" --------------------------------- CMDLINE (gl)

"                       OPTIONS

"   CURSORCOLUMN
nn glcc :set cursorcolumn!<CR>

"   LCD
nn glcd :lc %:h<CR>

"   CURSORLINE
nn glcl :set cursorline!<CR>

"   HLSEARCH
nn glhl :set hlsearch!<CR>

"   LIST
nn glli :set list!<CR>

"   PRINT DATE
nn glpd :put=strftime('%a %d %b %Y')<CR>

"   SCROLLBIND
nn glsb :set scrollbind!<CR>

"   SCROLLOFF
nn glsc :exec ':set scrolloff=' . 999*(&scrolloff == 0)<CR>

"   SOURCE VIMRC
nn glso :silent write\|source $MYVIMRC\|e<CR>zR

"   SPELL
nn glsp :set spell!<CR>

"   VIRTUAL EDIT
nn glve :if &virtualedit == "" <BAR> set virtualedit=all <BAR>
            \ else <BAR> set virtualedit= <BAR>
            \ endif <BAR> set virtualedit?<CR>

"   CHANGE COLORS
if system("uname -s") == "Darwin\n"
    nn <silent> <Space>C :if &bg == "dark" <BAR> exec 'color seoul256-light \| set bg=light' <BAR>
                \ else <BAR> exec 'color dracula \| set bg=dark' <BAR>
                \ endif <BAR> colors<CR>
elseif system("uname -s") == "Linux\n"
    nn <Space>C :call ColorSwitch('seoul256-light', 'dracula')<CR>
endif

" --------------------------------- IMPROVEMENTS

"   CLIPBOARD
no <silent> <Space>y :silent !echo -n "<C-r>"" \| xclip -sel clip<CR>:redr!<CR>

"   QUICK CMDLINE
cno <c-h> <left>
cno <c-l> <right>

"   INDENT
nn <Space>= Mmmgo=G`mzz3<C-O>

"   SPACE WINDOW
no <Space>w <C-W>
nn <S-Left> <C-W><
nn <S-Up> <C-W>+
nn <S-Right> <C-W>>
nn <S-Down> <C-W>-
nn <Space>wM <C-W>_\|<C-W><BAR>
no <Space>wX <C-W>x\|<C-W>_\|<C-W><BAR>

"   LEARNING ZONE
nn <Up>         <nop>
nn <Down>       <nop>
nn <Left>       <nop>
no <Right>      <nop>

"   GARDE FOU
no x :echo "Non appuie sur dl plutot !"<CR>
no X :echo "Non appuie sur dh plutot !"<CR>
no s :echo "Non appuie sur cl plutot !"<CR>
no S :echo "Non appuie sur cc plutot !"<CR>
