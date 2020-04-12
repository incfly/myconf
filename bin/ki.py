#!/usr/bin/env python 
# ki is the program for k8s and istio.
# - create delete cluster
#    - pooling, rental and reuse.

# - download by version
# - install uninstall istio, cleanly

# - install httpbin/sleep/tcp app

# - mtls config/ destination rule config shortcut.

# - inject / dis-inject sidecar.
# - confidump wrap on certain part using `jq`.
# - log level.
# - stackdriver filtering.
# traffic verification
# tls failure

# Impl

# ki istio -res 1.5.1
# TODO: uninstall istio.
#
# ki app -res httpbin,sleep
# ki app -res httpbin
# ki app -del httpbin,sleep
# ki pc $(kpid -lapp=foo)
# TODO: jq for cds lds.
#
# TODO: cluster creation.
#
# ki app httpbin,sleep -n namespace.
#
# ki pc <pod> listener|cluster --name='outbound.*9090',
#   name pattern using jq for extraction
# ki cluster abc
import os
import argparse
import subprocess

BIN_DIR='{home}/workspace/myconf/bin'.format(home=os.environ['HOME'])
KI_ENV = os.environ.copy()

def shell_wrapper(cli, dry_run=False):
  cli = subprocess.Popen(cli.strip('\n').split(' '), env=KI_ENV)
  cli.wait()


def istio_handler(args, version):
  print('Istio handler')
  shell_wrapper('''bash -x ./istio.sh {version}'''
    .format(version=version))


def app_handler(args, applist):
  print('App handler')
  apps = applist.split(',')
  op = 'apply'
  if args.delete:
    op = 'delete'
  for app in apps:
    yaml = "{root}/yamls/{app}.yaml".format(
      root=BIN_DIR, app=app)
    shell_wrapper('''bash -x {root}/app.sh {op} {yaml}'''.format(
      root=BIN_DIR, op=op, yaml=yaml))


def cluster_handler(args):
  pass


def envoy_dump(args, pod):
  print("Getting Envoy Config Dump")
  shell_wrapper('bash -x {root}/pc.sh {pod}'.format(
    root=BIN_DIR, pod=pod))


FUNCTION_MAP = {
  'istio' : istio_handler,
  'app' : app_handler,
  'pc': envoy_dump,
  'cluster': cluster_handler,
}

DEFAULT_RESOURCE = {
  'istio': '1.5.1',
  'app': 'httpbin',
  'pc': '',
}


def run(args):
  KI_ENV['KUBE_NS'] = args.namespace
  handler = FUNCTION_MAP[args.command]
  res = args.res
  if not res:
    res = DEFAULT_RESOURCE[args.command]
  handler(args, res)


if __name__ == "__main__":
  parser = argparse.ArgumentParser(description='Tools for Kuberntes and Istio.')
  parser.add_argument('command', choices=FUNCTION_MAP.keys(), help='bar help')
  parser.add_argument('-del', dest='delete', default=False, action='store_true', help='uninstall/delete/etc')
  parser.add_argument('-res', help='the resource')
  parser.add_argument('-n', dest='namespace', default='default', help='kube namespace to operate on')
  args = parser.parse_args()
  run(args)

