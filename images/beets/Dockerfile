# beets import job (home-config, media/lidarr): beets with the chroma plugin,
# ffmpeg, fpcalc (libchromaprint-tools) and curl (run.sh's Emby refresh).
# config.yaml + run.sh are mounted from a ConfigMap.
# Python stays on 3.14 until beets supports 3.15 (every release up to 2.14.1 says
# Requires-Python <3.15; see renovate.json, which keeps Renovate from bumping it).
FROM python:3.14-slim
RUN apt-get update \
 && apt-get install -y --no-install-recommends curl ca-certificates ffmpeg libchromaprint-tools \
 && rm -rf /var/lib/apt/lists/*
COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt && rm /tmp/requirements.txt
