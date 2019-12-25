## Dockerized test against given git & Python version locally

```shell script
cd ci/tox
cp .env-sample .env  # and optionally edit if needed to match your current user's UID/GID and/or to change git/python version
docker-compose up --build --exit-code-from=tox tox
```
