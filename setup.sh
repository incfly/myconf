#!/bin/bash

function install(){
    mkdir -p $HOME/workspace/tmp -p $HOME/workspace/bin $HOME/workspace/go/
    sudo apt-get install tmux git vim zsh golang-go \
      build-essential ack-grep hugo tree -y
}

function golang_setup() {
  pushd $HOME/workspace/tmp
  wget https://dl.google.com/go/go1.14.1.linux-amd64.tar.gz  -O go.tar.gz
  sudo tar -xvf go.tar.gz
  sudo mv go /usr/local
  popd
}

function kubectl_setup() {
  sudo apt-get update && sudo apt-get install -y apt-transport-https
  curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
  echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
  sudo apt-get update
  sudo apt-get install -y kubectl
  # TODO: move it to update function somewhere, now it's part of repo.
  # wget https://raw.githubusercontent.com/ahmetb/kubectl-aliases/master/.kubectl_aliases -L ~/.kubectl_aliases
}

rustsetup() {
  bash rust/setup.sh
}

function myconf_setup(){
    # install oh-my-zsh
    echo "installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    echo "copy settings(vim, tmux, zsh, dircolors, ssh)..."
    cp vim/.vimrc ~/
    mkdir -p $HOME/.ssh/ && cat ssh/config >> ~/.ssh/config
    cp -r vim/.vim ~/
    cp tmux/.tmux.conf ~/
    ln -s $(pwd)/git/.gitconfig $HOME/.gitconfig
    cp zsh/.zshrc ~
    # https://github.com/junegunn/fzf#installation
    echo "=======================\nInstall Bash Fuzzy Finder...=======================\n"
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
    echo "done!"
}

# install necessary software
#install
#myconf_setup
# golang_setup
