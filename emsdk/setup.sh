# https://emscripten.org/docs/getting_started/downloads.html#installation-instructions
setup() {
  mkdir -p $HOME/workspace/github.com/emscripten-core
  cd $HOME/workspace/github.com/emscripten-core
  git clone https://github.com/emscripten-core/emsdk.git
  cd emsdk
  ./emsdk install latest
  ./emsdk activate latest
  source ./emsdk_env.sh
}
