KUBE_NS=${KUBE_NS:-default}
op=${1:-apply}
yaml=${2:-https://github.com/istio/istio/blob/release-1.5/samples/httpbin/httpbin.yaml}

kubectl ${op} -f ${yaml} -n ${KUBE_NS}
