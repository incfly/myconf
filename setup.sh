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

function kubectl_setup() {
  sudo apt-get update && sudo apt-get install -y apt-transport-https
  curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
  echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
  sudo apt-get update
  sudo apt-get install -y kubectl
  wget https://raw.githubusercontent.com/ahmetb/kubectl-aliases/master/.kubectl_aliases -L ~/.kubectl_aliases
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

    # https://github.com/junegunn/fzf#installation
    echo "=======================\nInstall Bash Fuzzy Finder...=======================\n"
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install

    echo "done!"
}

# install necessary software
install
myconf_setup
golang_setup
