set -eu
python -c "import docx"
pdftoppm -v 2>&1 | head -1
pdftotext -v 2>&1 | head -1
