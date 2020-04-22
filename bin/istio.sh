VERSION=${1:-1.5.1}
pushd $HOME/workspace/tmp/ && \
  curl -L https://git.io/getLatestIstio | ISTIO_VERSION=$VERSION  sh - && \
  istio-${VERSION}/bin/istioctl manifest apply --set profile=demo && \
  kubectl label ns default istio-injection=enabled  --overwrite && \
  popd
