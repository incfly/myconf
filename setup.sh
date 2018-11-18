#!/bin/bash

function install(){
    sudo apt-get install tmux git vim zsh golang-go build-essential -y
}

# TODO: detect whether golang hasbeen installed.
function golang_setup() {
  mkdir -p ~/workspace/go/
  mkdir tmp/
  pushd tmp
  wget https://dl.google.com/go/go1.10.linux-amd64.tar.gz
  sudo tar -xvf go1.10.linux-amd64.tar.gz
  sudo mv go /usr/local
  popd
  rm -rf tmp
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
golang_setup
