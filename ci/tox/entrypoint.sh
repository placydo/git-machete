#!/usr/bin/env bash

{ [[ -f setup.py ]] && grep -q "name='git-machete'" setup.py; } || {
  echo "Error: the repository should be mounted as a volume under $(pwd)"
  exit 1
}

set -e -u -x

TOXENV="pep8,py${PYTHON_VERSION/./}" tox
$PYTHON setup.py install --user
PATH=$PATH:~/.local/bin/
git machete --version
