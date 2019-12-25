FROM ubuntu

RUN apt-get update && apt-get install -y autoconf gcc gettext libz-dev make python-pip python3-pip software-properties-common unzip wget
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update

ARG git_version
RUN wget -q https://github.com/git/git/archive/v$git_version.zip
RUN unzip -q v$git_version.zip
WORKDIR git-$git_version
RUN make configure
RUN ./configure
RUN make
RUN make install
RUN git --version

ARG python_version
ENV PYTHON_VERSION=${python_version}
ENV PYTHON="python${python_version}"
RUN apt-get install -y $PYTHON
RUN $PYTHON -m pip install tox

ARG user_id
ARG group_id

RUN "[" ${user_id:-0} -ne 0 ] \
    && [ ${group_id:-0} -ne 0 ] \
    && groupadd -g ${group_id} ci-user \
    && useradd -l -u ${user_id} -g ci-user ci-user \
    && install -d -m 0755 -o ci-user -g ci-user /home/ci-user

USER ci-user

COPY --chown=ci-user:ci-user entrypoint.sh /home/ci-user/entrypoint.sh
RUN chmod +x ~/entrypoint.sh
ENTRYPOINT /home/ci-user/entrypoint.sh

WORKDIR /home/ci-user/git-machete
