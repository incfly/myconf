mkdir -p $HOME/tmp
pushd $HOME/tmp
wget https://github.com/cli/cli/releases/download/v0.6.1/gh_0.6.1_linux_amd64.deb
sudo dpkg -i ./gh_0.6.1_linux_amd64.deb
popd
