# Smoke test, run inside the built image (see .github/workflows/build.yml).
set -eu
beet version
python -c "import beetsplug.chroma, acoustid"
fpcalc -version
ffmpeg -version | head -1
curl --version | head -1
