# contracts-bridge (homeops): python + python-docx + poppler-utils (pdftoppm/pdftotext
# for finding the signature block). The service code is mounted from a ConfigMap.
FROM python:3.15-slim
RUN apt-get update \
 && apt-get install -y --no-install-recommends poppler-utils \
 && rm -rf /var/lib/apt/lists/*
COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt && rm /tmp/requirements.txt
