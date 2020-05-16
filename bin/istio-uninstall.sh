source $HOME/.zshrc
krm ValidatingWebhookConfiguration --all-namespaces --all
krm dr --all --all-namespaces                                                       
krm policy --all --all-namespaces        
krm meshpolicy --all --all-namespaces
krm PeerAuthentication --all --all-namespaces
# TODO: some forcing?
krm ns istio-system