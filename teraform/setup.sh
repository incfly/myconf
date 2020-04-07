mkdir -p tmp && pushd tmp
wget https://releases.hashicorp.com/terraform/0.12.20/terraform_0.12.20_linux_amd64.zip
unzip *.zip
sudo mv terraform /usr/local/bin
popd
