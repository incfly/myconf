echo '=======Installing Helm==========='
pushd $HOME/workspace/tmp
mkdir -p downloads/
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
popd
helm version
echo '=======Finished Helm==========='
