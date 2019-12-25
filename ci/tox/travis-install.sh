#!/usr/bin/env bash

set -e -o pipefail -u -x

DOCKER_TAG=git${GIT_VERSION}-python${PYTHON_VERSION}-$(git rev-parse HEAD:ci/tox)
export DOCKER_TAG
cd ci/tox

# If the image corresponding to the expected git&python versions and the current state of ci/tox is missing, build it and push to Docker Hub.
docker-compose pull tox || {
  docker-compose build --build-arg user_id="$(id -u)" --build-arg group_id="$(id -g)" tox
  echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
  docker-compose push tox
}
