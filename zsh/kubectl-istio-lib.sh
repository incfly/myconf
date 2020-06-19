# TODO support kpid podprefix.namespace format
# kpid get the pod id the first one random, not matter in 99% case.
# rely on .kubectl_alias
kpid() {
  #kgpo $@ -o jsonpath='{.items[0].metadata.name}'
  kubectl get pods -o jsonpath='{.items[*].metadata.name}' | tr ' ' '\n' | grep $1 | tr -d '\n'
}

kpidn() {
  #kgpon $@ -o jsonpath='{.items[0].metadata.name}' 
  kubectl get pods --namespace $1 -o jsonpath='{.items[*].metadata.name}' | tr ' ' '\n' | grep $2 | tr -d '\n'
}
