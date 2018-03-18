#!/usr/bin/env bash -e

VERSION=$1

if [[ -z $VERSION ]]; then
  echo "Please specify a version"
  exit 1
fi

echo
echo "--- Starting Build Server Docker Container"
echo

docker run -d -p 22:22 -P elixir-build-$VERSION
