# homelab-images

Container images for the homelab (`gergelyzs/home-config`) and HomeOps (`gergelyzs/homeops`)
services. Each image only bakes in **public dependencies** (Python packages, apt packages, CLIs);
the services' own code stays in the private repos and is mounted from ConfigMaps. That replaces
the old pattern of running `pip install` / `apt-get install` on every container start.

| Image | Contents | Used by |
|---|---|---|
| `ghcr.io/gergelyzs/contracts-bridge` | python, `python-docx`, `poppler-utils` | homeops: contracts-bridge |
| `ghcr.io/gergelyzs/python-nats` | python, `nats-py`, `httpx` | homeops: dav-writer, sync-bridge |
| `ghcr.io/gergelyzs/beets` | python, `beets[chroma]`, ffmpeg, fpcalc, curl | home-config: beets import CronJob |
| `ghcr.io/gergelyzs/claude-code` | node, python3, Claude Code CLI | home-config: warranty classifier |

## Builds

`.github/workflows/build.yml` builds `images/<name>/` for `linux/amd64` and `linux/arm64`:

- **push to `main`** that touches `images/<name>/` builds that image;
- **manual run** ("Build images" → Run workflow) builds one image or all.

Tags: `<YYYY.MM.DD>.<run number>` and `latest`. Deployments pin the dated tag; Renovate in
home-config/homeops moves them to each new build.

## Updates

`.github/workflows/renovate.yml` + `renovate.json`: the same Renovate + AI-review setup as the two
infra repos. Base images (`FROM ...`), `requirements.txt` pins and versions marked with a
`# renovate:` comment above an `ARG` are updated; minor/patch go straight to `main` (one grouped
commit), majors and Python minors get a PR with an AI review. Every change to an image folder
triggers a rebuild.

## Adding an image

Create `images/<name>/Dockerfile` (+ `requirements.txt` if it has Python deps), push to `main`.
Keep secrets and private code out: this repository and its packages are public.
