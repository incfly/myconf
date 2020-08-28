alias istioctl=$HOME/workspace/go/src/istio.io/istio/out/linux_amd64/istioctl

# Dev config file root path.
devc() {
  cc=${CASE:-"default"}
  echo "$HOME/workspace/github.com/incfly/sysamples/istio/cases/$cc"
}

# for envoy dev as of 2020/08/09, https://github.com/envoyproxy/envoy/blob/master/bazel/README.md
export PATH=$PATH:$HOME/bin/clang+llvm-10.0.0/bin
