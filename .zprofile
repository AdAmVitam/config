## General
##########

export PATH=$PATH:"$HOME/.local/bin"
export PATH=$PATH:"$HOME/.local/script"

export NOTES=$HOME/git/Notes
export DOTVIM=$HOME/.config/vim

[ -r $HOME/.zshrc ] && source $HOME/.zshrc

## i3
#####

if [[ "$OSTYPE" == "linux"* ]] && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]
then
    startx
fi
