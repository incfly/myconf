alias istioctl=$HOME/workspace/go/src/istio.io/istio/out/linux_amd64/istioctl
alias ic='istioctl'
alias ki="${HOME}/workspace/github.com/incfly/sysamples/istio/bin/ki.py"
export PATH=$PATH:$HOME/workspace/bin/clang+llvm-10.0.0/bin:$HOME/workspace/bin

# Dev config file root path.
# TODO(jianfeih): improvements
# - change to python; read the sysamples/istio/.devrc;
# - and use the file first env var override.
devc() {
  cc=${CASE:-"default"}
  echo "$HOME/workspace/github.com/incfly/sysamples/istio/cases/$cc"
}

# for envoy dev as of 2020/08/09, https://github.com/envoyproxy/envoy/blob/master/bazel/README.md
export PATH=$PATH:$HOME/bin/clang+llvm-10.0.0/bin
