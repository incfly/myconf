envoysetup() {
  # https://github.com/envoyproxy/envoy/blob/master/bazel/README.md#ubuntu
  sudo apt-get install \
   libtool \
   cmake \
   automake \
   autoconf \
   make \
   ninja-build \
   curl \
   unzip \
   virtualenv -y
  # https://github.com/envoyproxy/envoy/blob/master/bazel/README.md#installing-bazelisk-as-bazel
  sudo wget -O /usr/local/bin/bazel https://github.com/bazelbuild/bazelisk/releases/latest/download/bazelisk-linux-amd64
  sudo chmod +x /usr/local/bin/bazel
  # https://github.com/envoyproxy/envoy/blob/master/bazel/README.md#quick-start-bazel-build-for-developers
  wget https://github.com/llvm/llvm-project/releases/download/llvmorg-10.0.1/clang+llvm-10.0.1-armv7a-linux-gnueabihf.tar.xz
}
