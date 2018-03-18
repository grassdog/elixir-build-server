#!/usr/bin/env bash -e

VERSION=$1

if [[ -z $VERSION ]]; then
  echo "Please specify a version"
  exit 1
fi

echo
echo "--- Copying SSH public key"
echo

cp ~/.ssh/id_rsa.pub id_rsa.pub


echo
echo "--- Building Build Server Docker Image"
echo

docker build --tag=elixir-build-$VERSION .
