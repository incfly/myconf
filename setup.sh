#!/bin/bash

function install(){
    sudo apt-get install tmux git vim zsh
}

function myconf_setup(){
    # install oh-my-zsh
    echo "installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    echo "copy settings(vim, tmux, zsh, dircolors)..."
    cp vim/.vimrc ~/
    cp -r vim/.vim ~/

    cp tmux/.tmux.conf ~/

    cp git/.gitconfig ~/

    cp zsh/.zshrc ~

    cp dircolors/.dir_colors ~/
    echo "done!"
}

# install necessary software
install
myconf_setup