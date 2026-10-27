# beets import job (home-config, media/lidarr): beets with the chroma plugin,
# ffmpeg, fpcalc (libchromaprint-tools) and curl (run.sh's Emby refresh).
# config.yaml + run.sh are mounted from a ConfigMap.
FROM python:3.15-slim
RUN apt-get update \
 && apt-get install -y --no-install-recommends curl ca-certificates ffmpeg libchromaprint-tools \
 && rm -rf /var/lib/apt/lists/*
COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt && rm /tmp/requirements.txt
