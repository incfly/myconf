source $HOME/.zshrc
krm ValidatingWebhookConfiguration --all-namespaces --all
krm dr --all --all-namespaces                                                       
krm policy --all --all-namespaces        
krm meshpolicy --all --all-namespaces
krm PeerAuthentication --all --all-namespaces
# Sidecar injector if still persists can blocks the pod deployment when istiod pod is gone.
krm MutatingWebhookConfiguration istio-sidecar-injector
# TODO: some forcing?
krm ns istio-system
