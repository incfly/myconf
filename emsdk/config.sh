# emsdk cause clang++ pointed to its own pre-installed version... very troublesome.
loademsdk() {
  source $HOME/workspace/github.com/emscripten-core/emsdk/emsdk_env.sh 2>&1 >/dev/null
}
