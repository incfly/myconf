#!/bin/bash

ROOT="/home/jianfeih/workspace/myconf/misc_scripts"
DOWNLOAD_LOG="/dev/null"

function pushover() {
curl -s -F "token=a157qvkco7jwgihsb81r9jzkhjfiss" \
  -F "user=uo9ujo2o724f6y7vdnrjha41f6k619" \
  -F "message=from mesa.sh, $1" https://api.pushover.net/1/messages.json
}

# add random content into the download dir, only to test notification sys is WAI 
function add_random_file() {
  echo "random stuff" > random.txt
}

function download() {
  last=$(ls -d */ -t | head -n1)
  next=$(date "+%F-%H-%M")
  echo "last is $last, next is $next"
  mkdir $next
  pushd $next
  wget --level=1 -r mesagarden.com 
  popd

  # diff w/ previous download
  change=$(diff -rq $last $next)
  if [ $? -eq 0 ]; then
    # delete the current dir.
    echo "no difference, deleting..."
    rm -rf $next
  else
    # send notification, substr for pushover limit.
    echo "send notification..."
    pushover "last $last, next $next, change ${change:0:256}"
  fi
}

pushd $ROOT
log="/home/jianfeih/log/mesa-$(date +%F).log"
download >> $log 2>&1
popd
