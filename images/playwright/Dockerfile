# transmission scheduled-login CronJob (home-config): python + Playwright + Chromium, baked in
# instead of `pip install` + `playwright install --with-deps` on every run. The script itself is
# mounted from a ConfigMap. The playwright pin in requirements.txt decides which Chromium build is
# downloaded, so bump it (Renovate does) and the browser follows on the next image build.
# python 3.14, not 3.15: the library pins here are not checked against 3.15 yet.
FROM python:3.15-slim
ENV PLAYWRIGHT_BROWSERS_PATH=/ms-playwright
COPY requirements.txt /tmp/requirements.txt
# libatomic1: Playwright's bundled node driver needs it to even start, so `--with-deps` (which
# runs through that driver) can't install it. This is what broke the old runtime-install CronJob.
RUN apt-get update && apt-get install -y --no-install-recommends libatomic1 \
 && pip install --no-cache-dir -r /tmp/requirements.txt \
 && playwright install --with-deps chromium \
 && rm -rf /var/lib/apt/lists/* /tmp/requirements.txt
