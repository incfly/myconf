# sshgce jianfeih@1.2.3.4
function sshgce() {
  ssh  -o ProxyCommand="corp-ssh-helper %h %p" -i ~/.ssh/google_compute_engine $@
}

# sshgcepf ip port
function sshgcepf() {
  sshgce $1 -L "${2}:localhost:${2}"
}

function todogooglenothelpfulcmds() {
alias gd='cd /google/src/cloud/jianfeih/hjf/google3'
alias tmux='tmux -2'
alias blaze='blaze --blazerc=/usr/local/google/home/jianfeih/.blazerc'
alias btcfg='/google/data/ro/projects/bigtable/contrib/btcfg/btcfg'
alias fileutil_sm='/google/data/ro/projects/video/storage/util/fileutil --sm_access_service=blade:video-pipeline-youtube-sm-access-prod' 
alias lifeguard='/google/data/ro/projects/apphosting/tools/lifeguard.par'

alias pyformat="pyformat --yapf"
alias gcl='/usr/bin/gcl'

export JAVA_HOME='/usr/local/buildtools/java/jdk'
source /etc/bash_completion.d/g4d

alias sandman='/google/data/ro/projects/sandman/sandman.par'
alias local_guitar='/google/data/ro/projects/testing/integrate/local_guitar.par'
alias guitar_oneshot='/google/data/ro/projects/testing/integrate/guitar_oneshot.par'
alias guitar_sandman='/google/data/ro/projects/testing/integrate/guitar_sandman'
alias xray='/google/data/ro/projects/apphosting/tools/xray'
alias pastebin="/google/src/head/depot/eng/tools/pastebin"
alias gae_spool_client='/google/data/ro/projects/apphosting/tools/gae_spool_client.sh'
alias gaepools='/usr/bin/python2.7 /google/src/head/depot/google3/apphosting/scripts/tools/gaepools.py'
alias admin_session='/google/data/ro/projects/tonic/admin_session'
alias staging_gcloud='CLOUDSDK_API_CLIENT_OVERRIDES_COMPUTE=staging_v1 /google/data/ro/teams/cloud-sdk/gcloud'

# The next line updates PATH for the Google Cloud SDK.
source '/usr/local/google/home/jianfeih/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/usr/local/google/home/jianfeih/google-cloud-sdk/completion.zsh.inc'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export P4DIFF='colordiff -u'
export GOPATH="/usr/local/google/home/jianfeih/workspace/golang"
export GO111MODULE=on
export PATH=$PATH:$(go env GOPATH)/bin:$HOME/.bazel/bin
source ~/workspace/bitbucket/myconf/misc_scripts/z/z.sh
}

