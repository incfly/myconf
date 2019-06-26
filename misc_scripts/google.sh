# sshgce jianfeih@1.2.3.4
function sshgce() {
  ssh  -o ProxyCommand="corp-ssh-helper %h %p" -i ~/.ssh/google_compute_engine $@
}
