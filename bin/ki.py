#!/usr/bin/env python3
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
# TODO: cmd snippet of tcpdump.
# tcpdump -A/-n option.
#  this is after kube-proxy resolved, do not know original app destination.
#  not EDS/VIP distinguishing.
# access log parsing.
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
  if args.delete:
    shell_wrapper(f'zsh {BIN_DIR}/istio-uninstall.sh')
    return
  shell_wrapper('''bash -x {root}/istio.sh {version}'''
    .format(root=BIN_DIR, version=version))


def app_handler(args, applist):
  print('App handler')
  apps = applist.split(',')
  op = 'apply'
  if args.delete:
    op = 'delete'
  for app in apps:
    yaml = "{root}/yamls/{app}.yaml".format(
      root=BIN_DIR, app=app)
    shell_wrapper(f'bash -x {BIN_DIR}/app.sh {op} {yaml}')


def cluster_handler(args, cluster):
  print('Cluster handler')
  shell_wrapper(f'bash -x {BIN_DIR}/cluster.sh {cluster}')

def envoy_dump(args, pod):
  print(f'Getting Envoy Config Dump, pod = {pod}, output file {args.output}')
  shell_wrapper(f'bash -x {BIN_DIR}/pc.sh {pod} {args.output}')


def envoy_log(args, target):
  res = target.split(',')
  pod = res[0]
  level = 'info'
  if len(res) == 2:
    level = res[1]
  print(f'Changing Envoy {pod} log level to {level}')
  shell_wrapper(f'bash -x {BIN_DIR}/envoylog.sh {pod} {level}')


FUNCTION_MAP = {
  'istio' : istio_handler,
  'app' : app_handler,
  'pc': envoy_dump,
  'log': envoy_log,
  'cluster': cluster_handler,
}

DEFAULT_RESOURCE = {
  'istio': '1.5.1',
  'app': 'httpbin',
  'pc': '',
  'log': '',
}


def run(args):
  KI_ENV['KUBE_NS'] = args.namespace
  handler = FUNCTION_MAP[args.command]
  res = args.resource
  # positional arg does not make sense and not supported by argparse.
  if not res or res == 'default':
    res = DEFAULT_RESOURCE[args.command]
  handler(args, res)


if __name__ == "__main__":
  parser = argparse.ArgumentParser(description='Tools for Kuberntes and Istio.')
  parser.add_argument('command', choices=FUNCTION_MAP.keys(), help='bar help')
  parser.add_argument('-rm', dest='delete', default=False, action='store_true', help='uninstall/delete/etc')
  parser.add_argument('resource', nargs='?', help='the resource')
  parser.add_argument('-n', dest='namespace', default='default', help='kube namespace to operate on')
  # TODO: divide into a pc specific output file name.
  parser.add_argument('-o', dest='output', default='cfg.json', help='output file name')
  args = parser.parse_args()
  run(args)

