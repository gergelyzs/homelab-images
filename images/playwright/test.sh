set -eu
# Launch the real browser, not just import the package: a missing system library
# (libatomic, libnss3, ...) only shows up when Chromium starts.
python - <<'PY'
from playwright.sync_api import sync_playwright

with sync_playwright() as p:
    browser = p.chromium.launch(headless=True)
    page = browser.new_page()
    page.set_content("<form id='loginform'><input id='nev'></form>")
    page.fill("#nev", "x")
    assert page.input_value("#nev") == "x"
    print("chromium", browser.version)
    browser.close()
PY
