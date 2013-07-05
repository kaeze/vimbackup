#!/bin/sh
VIMHOME=~/.vim

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

[ -e "$VIMHOME/vimrc" ] && die "$VIMHOME/vimrc already exists."
[ -e "~/.vim" ] && die "~/.vim already exists."
[ -e "~/.vimrc" ] && die "~/.vimrc already exists."

#git clone git://github.com/vgod/vimrc.git "$VIMHOME"
git clone https://github.com/kaeze/vimbackup.git "$VIMHOME"
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
cd "$VIMHOME"
vim +BundleInstall +qall
#git submodule update --init

./install-vimrc.sh

cd bundle/command-t/ruby/command-t
(ruby extconf.rb && make) || warn "Can't compile Command-T."

echo "vgod's vimrc is installed."
