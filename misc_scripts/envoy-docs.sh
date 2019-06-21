#!/bin/bash

# run on laptop
laptopssh() {
  ssh -L 8000:localhost:8000 -o ProxyCommand="corp-ssh-helper %h %p" -i .ssh/google_compute_engine jianfeih@35.226.253.86
}

# run in envoy/generated/docs
gceserve() {
  python3 -m http.server
}
