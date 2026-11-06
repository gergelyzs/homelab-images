# Customer website backup + restore test, and the Home Assistant backup pull
# (homeops: k3s/apps/customer-backup). restic (off-site repo), lftp (FTP/FTPS
# mirror), openssh-client + rsync (SSH hosts), curl (DB-dump endpoint,
# Kubernetes API, HA backup download), websocat (HA websocket API: backup
# listing has no REST endpoint), mariadb-client (import into
# staging), php + wp-cli (search-replace and options on the restored staging
# site, always run with --skip-plugins --skip-themes). The scripts themselves
# are mounted from a ConfigMap.
FROM alpine:3.24

# renovate: datasource=github-releases depName=wp-cli/wp-cli
ARG WP_CLI_VERSION=v2.12.0

RUN apk add --no-cache \
      bash ca-certificates coreutils curl findutils gzip jq lftp mariadb-client \
      openssh-client restic rsync tzdata websocat \
      php84 php84-ctype php84-iconv php84-json php84-mbstring php84-mysqli php84-openssl \
      php84-curl php84-phar php84-tokenizer php84-zip php84-zlib \
 && ln -sf /usr/bin/php84 /usr/bin/php \
 && v="${WP_CLI_VERSION#v}" \
 && curl -fsSLo /usr/local/bin/wp "https://github.com/wp-cli/wp-cli/releases/download/v${v}/wp-cli-${v}.phar" \
 && echo "$(curl -fsSL "https://github.com/wp-cli/wp-cli/releases/download/v${v}/wp-cli-${v}.phar.sha512")  /usr/local/bin/wp" | sha512sum -c - \
 && chmod +x /usr/local/bin/wp \
 && restic version && lftp --version | head -1 && websocat --version && wp --allow-root --version

