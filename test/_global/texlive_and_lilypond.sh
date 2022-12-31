#!/bin/bash

set -e

# Optional: Import test library
source dev-container-features-test-lib

# Definition specific tests
check "check for lilypond" lilypond --version
check "check for latex" latex --version
check "check for pdflatex" pdflatex --version
check "check for lualatex" lualatex --version

# Report result
reportResults