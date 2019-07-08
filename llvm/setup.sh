llvmsetup() {
  wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key |sudo apt-key add -
  sudo apt-add-repository "deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-8 main"
  sudo apt-get update
  sudo apt-get install clang-format-8 llvm-8 clang-8 lldb-8 -y
  sudo ln -s /usr/bin/clang++-8 /usr/bin/clang++
  sudo ln -s /usr/bin/clang-8 /usr/bin/clang
}

