# dav-writer + sync-bridge (homeops): python + the NATS client + httpx.
# The service code is mounted from a ConfigMap.
FROM python:3.15-slim
COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt && rm /tmp/requirements.txt
