ROOT=$HOME/workspace/myconf/bin
function keycert() {
  pushd $ROOT/tmp
  openssl req -x509 -sha256 -nodes -days 365 -newkey \
    rsa:2048 -subj '/O=example Inc./CN=example.com' -keyout example.com.key \
    -out example.com.crt
  openssl req -out nginx.example.com.csr -newkey rsa:2048 -nodes -keyout nginx.example.com.key \
    -subj "/CN=nginx.example.com/O=some organization"
  openssl x509 -req -days 365 -CA example.com.crt -CAkey example.com.key -set_serial 0 \
    -in nginx.example.com.csr -out nginx.example.com.crt
  kubectl create secret tls nginx-server-certs --key nginx.example.com.key --cert nginx.example.com.crt
  popd
}

function nginxcfg() {
  kubectl create configmap nginx-configmap --from-file=nginx.conf=${ROOT}/ingress/nginx.conf \
   && kubectl apply -f ${ROOT}/ingress/nginx.yaml
}

# kubectl exec -it $(kpid -lapp=sleep) -c istio-proxy -- curl -v -k  https://my-nginx.default.svc.cluster.local
function check() {
  kubectl exec -it $(kubectl get pod  -l run=my-nginx -o jsonpath={.items..metadata.name}) -c istio-proxy -- \
    curl -v -k --resolve nginx.example.com:443:127.0.0.1 https://nginx.example.com
}
