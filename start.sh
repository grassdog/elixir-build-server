#!/usr/bin/env bash -e

echo
echo "--- Starting Build Server Docker Container"
echo

docker run -d -p 22:22 -P elixir-build-1.5
