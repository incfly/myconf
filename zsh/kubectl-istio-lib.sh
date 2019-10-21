# kpid get the pod id the first one random, not matter in 99% case.
# rely on .kubectl_alias
kpid() {
  kgpo $@ -o jsonpath='{.items[0].metadata.name}'
}

kpidn() {
  kgpon $@ -o jsonpath='{.items[0].metadata.name}' 
}
