# Elixir Build Server

A docker container which can be used to build elixir applications for distribution on Ubuntu.

Build with `./build.sh` and start via `./start.sh`. Assumes you have docker running locally.

Point [edeliver](https://github.com/edeliver/edeliver) to this docker container to build your releases.

```sh
# In .deliver/config
BUILD_HOST="localhost"
BUILD_USER="builder"
BUILD_AT="/tmp/edeliver/summate/builds/backend"

# In ~/.ssh/config
Host localhost
  User builder
  StrictHostKeyChecking no
  UserKnownHostsFile=/dev/null
```
