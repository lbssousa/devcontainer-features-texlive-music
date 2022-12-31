#!/bin/bash

set -e

# Optional: Import test library
source dev-container-features-test-lib

# Definition specific tests
check "latex" latex --version
check "pdflatex" pdflatex --version
check "lualatex" lualatex --version

# Report result
reportResults