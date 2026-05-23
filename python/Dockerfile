FROM python:3.9-slim-bullseye

USER root

RUN addgroup --gid 1000 mangos; exit 0
RUN adduser --uid 1000 --gid 1000 --shell /bin/sh mangos; exit 0

COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt

USER mangos

WORKDIR /python

# Hack to keep the container up and not complain
CMD tail -f /dev/null
