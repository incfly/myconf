# script <pod> cluster
KUBE_NS=${KUBE_NS:-default}

po=${1}
output=${2}
kubectl exec -it ${po} -c istio-proxy -n ${KUBE_NS} -- curl localhost:15000/config_dump > ${output}
# cat ${po}.json | jq ${jpath} > ${output}
