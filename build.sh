#!/usr/bin/env bash -e

echo
echo "--- Copying SSH public key"
echo

cp ~/.ssh/id_rsa.pub id_rsa.pub


echo
echo "--- Building Build Server Docker Image"
echo

docker build --tag=elixir-build-1.5 .
