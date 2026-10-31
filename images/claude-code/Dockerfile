# python3 + the Claude Code CLI, for jobs that run `claude -p` on a Claude
# subscription (CLAUDE_CODE_OAUTH_TOKEN from `claude setup-token`) instead of
# API credits - the warranty scan classifier. Stdlib python only.
# Moved here from gergelyzs/python-anthropic (claude-code.Dockerfile).
FROM node:26-bookworm-slim

# renovate: datasource=npm depName=@anthropic-ai/claude-code
ARG CLAUDE_CODE_VERSION=2.1.316
RUN apt-get update \
 && apt-get install -y --no-install-recommends python3 ca-certificates \
 && rm -rf /var/lib/apt/lists/* \
 && npm install -g --no-fund --no-audit @anthropic-ai/claude-code@${CLAUDE_CODE_VERSION} \
 && npm cache clean --force \
 && claude --version

ENV DISABLE_AUTOUPDATER=1
