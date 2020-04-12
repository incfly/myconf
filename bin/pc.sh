# script <pod> cluster
KUBE_NS=${KUBE_NS:-default}

po=${1}
jpath=${2}
output=${3}
kubectl exec -it ${po} -c istio-proxy -n {KUBE_NS} -- curl localhost:15000/config_dump > cfg.json
# cat ${po}.json | jq ${jpath} > ${output}
