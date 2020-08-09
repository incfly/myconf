alias istioctl=$HOME/workspace/go/src/istio.io/istio/out/linux_amd64/istioctl

# Dev config file root path.
devc() {
  cc=${CASE:-"default"}
  echo "$HOME/workspace/github.com/incfly/sysamples/istio/cases/$cc"
}

