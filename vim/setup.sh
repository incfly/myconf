vimsetup() {
  # https://github.com/VundleVim/Vundle.vim#about
  sudo apt install build-essential cmake python3-dev -y
  # ln -s vim/.vim ~
  # ln -s vim/.vimrc ~
  cp vim/.vimrc ~/
  cp -r vim/.vim ~/
  # Invoking the PluginInstall in Vim
  vim -E -c PluginInstall -c q
  # Run
  # cd $HOME/.vim/bundle/YouCompleteMe/
  # python3 install.py --clang-completer
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
}