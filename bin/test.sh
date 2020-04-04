#!/bin/bash
set -euo pipefail

cd "$(dirname $0)/../test"
docker run -v $(pwd)/:/workspace kairops/dc-mdline:beta example.md | diff example.html -