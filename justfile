# chadloder.dev landing page — justfile
#
# Workflow:
#   just build      # render index.html from index.html.j2 (Jinja2)
#   just refresh    # discard SVG cache, re-fetch from FA upstream, then build
#   just preview    # serve site locally on http://localhost:8000

# Default: list recipes.
default:
    @just --list

# Render index.html from index.html.j2 + PROFILE/ICONS in scripts/build.
# Add or remove a profile link by editing the ICONS list in that script.
build:
    ./scripts/build

# Wipe SVG cache and re-fetch from FontAwesome upstream, then build.
refresh:
    rm -rf icons/
    ./scripts/build

# Serve the site locally for preview. Python stdlib server on :8000.
preview:
    @echo "Serving on http://localhost:8000  (Ctrl-C to stop)"
    @python3 -m http.server 8000
