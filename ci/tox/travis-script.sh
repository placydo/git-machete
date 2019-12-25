#!/usr/bin/env bash

set -e -o pipefail -u -x

DOCKER_TAG=git${GIT_VERSION}-python${PYTHON_VERSION}-$(git rev-parse HEAD:ci/tox)
export DOCKER_TAG
cd ci/tox

docker-compose up --exit-code-from=tox tox
