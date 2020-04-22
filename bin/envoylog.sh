pod=$1
level=${2}
kubectl exec -it ${pod} -c istio-proxy -- curl "localhost:15000/logging?level=${level}" -X POST
