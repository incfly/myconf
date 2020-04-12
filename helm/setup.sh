echo '=======Installing Helm==========='
pushd $HOME/workspace/tmp
mkdir -p downloads/
wget https://get.helm.sh/helm-v2.16.5-linux-amd64.tar.gz
tar xf ./helm*.tar.gz
sudo mv ./linux-amd64/helm /usr/local/bin/helm
sudo mv ./linux-amd64/tiller /usr/local/bin/
popd
helm version
echo '=======Finished Helm==========='
